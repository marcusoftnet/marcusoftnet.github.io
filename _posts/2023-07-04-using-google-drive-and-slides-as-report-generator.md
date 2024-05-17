---
layout: post
title: "Using Google Drive & Slide API as report template engine"
author: "Marcus Hammarberg"
date: 2023-07-04 12:00:00
tags:
  - Programming
  - Life of a consultant
---

At my current job, we are using Google Cloud Platform, which is awesome since it opens up so many services that exist in the Google ecosystem.

The other week a need arose to create reports based on data, from a template. We were wondering for a while and then decided that Google Slides could be up for the job. It was. But there were quite a lot of small hoops to jump around in, especially considering that there were so many different versions, languages, and ways to do things.

Here's my plan:

1. Create a Google Slide Template that will serve as the report original. This will contain some placeholder strings that we will replace with data from the report
1. Create a folder for the report we are generating, and make a copy of the report original to this folder.
1. Uploading a few pictures to this folder, and ensure that are available to merge into a Google Slide
1. Replace placeholder tokens with text
1. Replace placeholder tokens with images. There's a nasty bug here that needs a workaround

My solution also includes [StreamLit](https://streamlit.io/) but I'm going to leave that out of this solution. I will, however, use Python for these examples and include some helpers. I'll write this so that we build a nice little reusable component that you can tweak to your heart's content.

Let's do it. It will be fun.

<!-- excerpt-end -->

## Credentials

Anything you do against the Google APIs needs validation of credentials. How you obtain these credentials will be very different depending on where you run the code.

We are using StreamLit (darn it - I said that I was going to leave it out) and are using a service account for our access. There are several reasons for this, but mainly we can use the code in batch and websites.

There are other descriptions on [how to get an access token](https://developers.google.com/workspace/guides/create-credentials) and I'm leaving that part out.

We do this:

```python
from google.oauth2.credentials import Credentials
from googleapiclient.discovery import build
import logging

logger = logging.getLogger(__name__)

class GoogleDriveService:
    def __init__(self, authenticated_credentials_secret: GoogleSecret, supports_all_drives: bool = True):
        self.authenticated_credentials_secret = authenticated_credentials_secret
        self.supports_all_drives = supports_all_drives

    @lru_cache
    def auth_drive(self):
        credentials = Credentials.from_authorized_user_info(json.loads(self.authenticated_credentials_secret.read()))
    return  build(serviceName="drive", version="v3", credentials=credentials)
```

We read the authenticated token using our own `GoogleSecret`-class (`self.authenticated_credentials_secret.read()`). This gives us a JSON (i.e. the secret is stored as a Google Secret) that we then pass to the `Credentials.from_authorized_user_info` to get the credentials.

That little `auth_drive` will be reused all over. Just wait.

## Create a folder for the report

Let's now create a folder for the report. I'm going to first put it in a shared folder called `Generated reports` or something and secondly put the `Generated reports` folder on a shared drive. This allows me to control access to the files and folders easily.

First, create a shared drive (if you want to) and then create a `Reports`-folder. And then a `Generated Reports` folder in it. By "create" I mean manually, by going to [Google Drive](http://drive.google.com/) and clicking. Done? Ok - great.

You will need to give access to the account(s) that is going to run this to the `Reports`-folder. They will need `Content manager`-role.

It should look like this now:

- `Reports` - is the root for everything report related
  - `Generated reports` - is where we will create a folder for each report.

Let's now write some code to create a folder for each report, in the `Generated Reports`-folder. Put this method inside the `GoogleDriveService` class

```python
def create_folder(self, folder_name: str, parent_folder_id: str) -> GoogleDriveObject:
  try:
    folder_metadata = {
      "name": folder_name,
      "parents": [parent_folder_id],
      "mimeType": "application/vnd.google-apps.folder"
    }

    logger.info(f"Creating folder {folder_name} in folder with id {parent_folder_id}")

    folder = self.auth_drive().files().create(
      body=folder_metadata,
      supportsAllDrives=self.supports_all_drives,
      fields=GoogleDriveObject.FIELDS_TO_GET).execute()

    return GoogleDriveObject(folder)

  except HttpError as error:
    logger.info(f"An error occurred while creating folder: {error}")
    return None
```

This is our first time interacting with the Google API (in this blog post) so it's worth taking some time to describe how it works. It's very hierarchical and REST-like in its approach. Even here in the Python code.

See how we use `self.auth_drive()` there in the middle? That will give us a client that we can use to interact with folders, permissions, and files.

`self.auth_drive().files()` means that we are going to do things with files. For example `self.auth_drive().files().create()` to create a new file.

That `.create()` will behind the scenes issue a [POST request to the HTTP API](https://developers.google.com/drive/api/reference/rest/v3/files/create). The API is very well documented but typically talks about the HTTP or REST level rather than Python code that is only reserved for the overview and tutorials.

Each request has a body and optionally additional parameters. In our case, we create a `folder_metadata`-body that describes that we are going to create a folder (through the mime-type) and then put it in a `parent`-folder.

The `supportsAllDrives` was close to driving me crazy, but is needed FOR EVERY request that is done against a shared folder. That's why I took it as a parameter to the `GoogleDriveService` class.

Finally, the `fields` property of the request describes which fields you want in the response. Why not send all fields, you say? Well - [feast your eyes on this, my friend](https://developers.google.com/drive/api/reference/rest/v3/files#File). It's just a comma-separated list of fields like `id, name, thumbnailLink` for example.

I'll show you soon, what that `GoogleDriveObject` thing is (it's something that I have created.)

One very important thing is to execute the request. This is done with `.execute()` and needs to be called, or you have just created a request that is never used. It just sits there. Like a madman.

My method `create_folder` also adds some logging and error handling, both of which have proven invaluable to make sense of this.

### Encapsulate file responses in a `GoogleDriveObject` class

Finally (other sections will NOT be this long, I promise) let's talk about the `GoogleDriveObject`. My class looks like this:

```python
class GoogleDriveObject:
  FIELDS_TO_GET = "id, name, mimeType, fileExtension, webViewLink, webContentLink, thumbnailLink, createdTime, modifiedTime, parents"

  def __init__(self, google_drive_file_object: dict):
    self.file = google_drive_file_object

  @property
  def id(self):
    return self.file["id"]

  @property
  def name(self):
    return self.file["name"]

  @property
  def mime_type(self):
    return self.file["mimeType"]

  @property
  def file_extension(self):
    return self.file["fileExtension"]

  @property
  def web_view_link(self) -> str:
    return self.file["webViewLink"]

  @property
  def web_content_link(self) -> str:
    return self.file["webContentLink"]

  @property
  def thumbnail_link(self) -> str:
    return self.file["thumbnailLink"]

  @property
  def created_at(self) -> datetime.datetime:
    return parser.parse(self.file["createdTime"])

  @property
  def modified_at(self) -> datetime.datetime:
    return parser.parse(self.file["modifiedTime"])

  @property
  def parent_ids(self) -> List[str]:
    return self.file["parents"]
```

It's just an encapsulation of the response from any `files()` request. This will be useful, I promise.

### Let's use the `create_folder` method

These headings will build up a script, that calls out to the methods we have created, little by little.

Using the `create_folder` method will be something like this:

```python
drive = GoogleDriveService(reporting_credentials_secret)
ROOT_REPORT_FOLDER = "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
report_folder_name = f"a_client_name_report_{datetime.datetime.now().timestamp()}".replace(" ", "_")
report_folder = drive.create_folder(report_folder_name, ROOT_REPORT_FOLDER)
```

That will now create a folder called `a_client_name_report_XXXXXXXX` in the `Generated Reports`-folder (that has the ID `ROOT_REPORT_FOLDER`).

Two things to note here:

- `reporting_credentials_secret` is how we get access to Google Secrets
- the `ROOT_REPORT_FOLDER` is, yes, a hardcoded id for the `Generated Reports`-folder. You can get it from the URL of the folder that you [created in the earlier step](#create-a-folder-for-the-report)

Oh - that became longer than I wanted, but let's press on.

## Upload images to the report folder

I then need to include images (of graphs) in the report. These images need to be accessible over the internet, without credentials to be able to use them. That is a hustle and took me hours, if not days, to sort. But first - let's upload these images to the report folder.

Here's another method to upload a file to a folder:

```python
def upload_image_to_folder(self, folder_id: str, file_name: str, file_extension: str, data: bytes) -> GoogleDriveObject:
  try:
    file_name_with_extension = f"{file_name}.{file_extension}"

    file_metadata = {
        "name": file_name_with_extension,
        "parents": [folder_id]
    }
    media = MediaIoBaseUpload(io.BytesIO(data), mimetype=f"image/{file_extension}", resumable=True)

    logger.info(f"Uploading {file_name_with_extension} to {folder_id} ({len(data)} bytes)")

    file = self.auth_drive().files().create(
        media_body=media,
        body=file_metadata,
        supportsAllDrives=self.supports_all_drives,
        fields=GoogleDriveObject.FIELDS_TO_GET).execute()

    return GoogleDriveObject(file)
  except HttpError as error:
    logger.info(f"An error occurred while uploading files: {error}")
  return None
```

See here, how the interaction with the service is very similar? `self.auth_drive().files().create()`? The only difference is that we now create a `file_metadata` object that first describes the file and which folder to put it in (`parents`). Secondly, we need to make a `MediaIoBaseUpload` that describes this image. In other words, this method will only upload images (`mimetype` always starts with `image/`).

Also, I'm passing in the data of the files as `bytes` which easily can be passed to `MediaIoBaseUpload` using `io.BytesIO(data)`.

### Let's use the `upload_image_to_folder` method

Using the `upload_image_to_folder` method will be something like this:

```python
drive = GoogleDriveService(reporting_credentials_secret)
ROOT_REPORT_FOLDER = "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
report_folder_name = f"a_client_name_report_{datetime.datetime.now().timestamp()}".replace(" ", "_")
report_folder = drive.create_folder(report_folder_name, ROOT_REPORT_FOLDER)

## Reading image into a bytes array
with open("/local/path/to/a/file.png, "rb") as image:
  image_bytes = image.read()

efficiency_image = drive.upload_image_to_folder(folder_id=report_folder.id, file_name="efficiency",
  file_extension="png", data=image_bytes)
```

Nice, and we got a description for the created file that we are going to use later. (I upload quite a few of these per report generation, to be honest. Be sure to hold on to each created file description)

## Make image accessible without credentials

While we're fiddling around with the images, let's set the permission to `anyoneWithTheLink`. This is needed since Google Slides needs to be able to access the files over the internet, without credentials, to insert them in the report.

Yes - that is surprising. And a bit stupid. And [there's an open issue for Google to fix this](https://issuetracker.google.com/issues/148814758). That's what we have - let's roll with it.

But I don't like having access that wide open, so we are going to create a way for us to remove that permission after we have inserted the image in the presentation. Two methods are needed:

```python
def make_public(self, file_id: str) -> PermissionDescription:
  try:
    permission_body = {"role": "reader", "type": "anyone"}

    logger.info(f"Setting {file_id} to be accessible for anyone with the link")

    permission = self.auth_drive().permissions().create(
      body=permission_body, fileId=file_id,
      supportsAllDrives=self.supports_all_drives, fields=PermissionDescription.FIELDS_TO_GET
      ).execute()

    return PermissionDescription(permission)
  except HttpError as error:
    logger.info(f"An error occurred while changing permissions: {error}")
  return None

def remove_public_access(self, file_id: str):
  try:
    logger.info(f"Remove permission anyone with the link for {file_id}")

    self.auth_drive().permissions().delete(
        permissionId="anyoneWithLink", fileId=file_id, supportsAllDrives=self.supports_all_drives
        ).execute()

  except HttpError as error:
    logger.info(f"An error occurred while changing permissions: {error}")
  return None
```

Here we are interacting with `self.auth_drive().permissions()` but the interaction is very similar to before; to create a new permission for the file, you will need to create a body that sets `anyone` to the role `reader`.

I also created a little class to encapsulate the responses for permissions:

```python
class PermissionDescription:
  FIELDS_TO_GET = "id, displayName, type, kind, role, expirationTime"

  def __init__(self, google_drive_permission_object: dict):
    self.file = google_drive_permission_object

  @property
  def id(self):
    return  self.file["id"]

  @property
  def display_name(self):
    return  self.file["displayName"]

  @property
  def type(self):
    return  self.file["type"]

  @property
  def kind(self):
    return  self.file["kind"]

  @property
  def role(self):
    return  self.file["role"]

  @property
  def expiration_time(self) -> datetime.datetime:
    return  parser.parse(self.file["expirationTime"])
```

### Let's use `make_public` and `remove_public_access`

We are now running a little bit ahead of ourselves since we haven't used the Google Slide presentation yet, but it will look something like this:

```python
drive = GoogleDriveService(reporting_credentials_secret)
ROOT_REPORT_FOLDER = "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
report_folder_name = f"a_client_name_report_{datetime.datetime.now().timestamp()}".replace(" ", "_")
report_folder = drive.create_folder(report_folder_name, ROOT_REPORT_FOLDER)

## Reading image into a bytes array
with open("/local/path/to/a/file.png, "rb") as image:
  image_bytes = image.read()

efficiency_image = drive.upload_image_to_folder(folder_id=report_folder.id, file_name="efficiency",
  file_extension="png", data=image_bytes)

drive.make_public(file_id=efficiency_image.id)

## Report generation will happen here

drive.remove_public_access(file_id=efficiency_image.id)
```

Now that we have the infrastructure out of the way. Let's create the report template.

## Setting up the report template

Let's switch it up a bit and create a report template. This is a Google Slides file, that I put in the `Reports` (that is one level above `Generated Reports`) folder. It holds the layout and static content of the folder, as well as placeholders for the locations that we want to replace.

Create a slide deck now, note the id of the file.

You can use placeholders in whatever format you want, but I went for `{{place_holder_name}}`. For debugging purposes, I created a slide with all the placeholders in one place. Like this:

```text
Customer name: “{{customer_name}}”
Customer id: “{{customer_id}}”
Customer country: “{{customer_country}}”
Customer address: “{{customer_address}}”
Filter from-date: “{{filter_from_date}}”
Filter to-date: “{{filter_to_date}}”
```

For the images, I created a shape that was the same size as where I wanted the image to be. Create a shape and write `{{efficiency_graph}}` for example.

## Make a copy of the report template

For each report generation, we are going to make a copy of the report template and then make the replacements in the copy. Here's a method to make a copy of a file in another folder:

```python
def copy_file_to_folder(self, original_file_id: str, folder_id: str, file_name: str) -> GoogleDriveObject:
  try:
    body = {
        "name": file_name,
        "parents": [folder_id],
    }

    logger.info(f"Copying {original_file_id} to {folder_id} as {file_name}")

    result = self.auth_drive().files().copy(
        body=body, fileId=original_file_id, supportsAllDrives=self.supports_all_drives,
        fields=GoogleDriveObject.FIELDS_TO_GET
        ).execute()

    return GoogleDriveObject(result)
  except HttpError as error:
    logger.info(f"An error occurred while copying files: {error}")
  return None
```

There's not much new here, but we are using the `self.auth_drive().files().copy()` method. Be careful to not use the wrong file id in the wrong place... I tell you this from experience.

### Let's use the `copy_file_to_folder` method

```python
drive = GoogleDriveService(reporting_credentials_secret)
ROOT_REPORT_FOLDER = "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
EFFICIENCY_REPORT_TEMPLATE = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
report_folder_name = f"a_client_name_report_{datetime.datetime.now().timestamp()}".replace(" ", "_")
report_folder = drive.create_folder(report_folder_name, ROOT_REPORT_FOLDER)

## Reading image into a bytes array
with open("/local/path/to/a/file.png, "rb") as image:
  image_bytes = image.read()

efficiency_image = drive.upload_image_to_folder(folder_id=report_folder.id, file_name="efficiency", file_extension="png", data=image_bytes)
drive.make_public(file_id=efficiency_image.id)

report_name = f"a_client_report_name"
report_deck = drive.copy_file_to_folder(original_file_id=REPORT_TEMPLATE, folder_id=report_folder.id, file_name=report_name)

drive.remove_public_access(file_id=efficiency_image.id)
```

## Make replacements

Finally - we now have all the moving parts in place:

- we have a copy of the report template, where we can make replacements
- we have images that we can access over the internet
- everything is a folder for the report.

Let's do this, by creating another class that wraps the Google Slides API, it will only be one method in there, but boy are we going to use it a lot.

```python
from google.oauth2.credentials import Credentials
from googleapiclient.discovery import build
from googleapiclient.errors import HttpError

logger = logging.getLogger(__name__)


class GoogleSlidesService:
  def __init__(self, authenticated_credentials_secret: GoogleSecret):
    self.authenticated_credentials_secret = authenticated_credentials_secret

  @lru_cache
  def auth_slides(self):
    credentials = Credentials.from_authorized_user_info(json.loads(self.authenticated_credentials_secret.read()))
    return build(serviceName="slides", version="v1", credentials=credentials)

  def batch_update(self, requests: List[dict], presentation_id: str) -> any:
    try:
      logger.info(f"Performing batch update of {len(requests)} placeholders in {presentation_id}")

      body = {"requests": requests}
      response = self.auth_slides().presentations().batchUpdate(
          body=body, presentationId=presentation_id).execute()

      return response

    except HttpError as error:
      logger.info(f"An error occurred while updating the presentation: {error}")
      return None
```

We recognize much of this, thank God:

- We are creating a class that uses a Google Secret stored JSON token to create credentials.
- We then call the `self.auth_slides().presentations().batchUpdate()` to make many updates at once. This is much more performant and effective than doing one change at a time.

That leaves one missing piece - what are those: `requests: List[dict]`

## Creating requests for textual replacements

The replacement is doing a `Search and Replace all` through all slides. But using the Google Slides API. And for images too.

Let's make a method for the textual search-and-replace and put it in the `GoogleSlidesService` class:

```python
@staticmethod
def create_text_replace_request(placeholder: str, value: str) -> dict:
  return {"replaceAllText": {
      "replaceText": f"{value}",
      "containsText": {
          "text": f"{placeholder}",
          "matchCase": False
      }
  }}
```

This describes the search and replace that we want to perform, what to search for, and how to search for it.

That was easy - let's do one for images too. That is easy too.

## Creating requests for image replacements

```python
@staticmethod
def create_image_replace_request(placeholder: str, image_url: str) -> dict:
  return {"replaceAllShapesWithImage": {
      "imageUrl": f"{image_url}",
      "replaceMethod": "CENTER_INSIDE",
      "containsText": {
          "text": f"{placeholder}",
          "matchCase": False
      }
  }}
```

For this to work we need a public `image_url` (I'll show you a hack soon), that we pass to the method. Also note that we are replacing a shape here, using `CENTER_INSIDE`. I found this useful as that will mean that I can design the template using the placeholder shapes and then trust that it works as expected by just replacing them with images.

### Let's use the `batch_update` method

We are not quite ready for this, but before I lose everyone, let's show how this will be used in our script:

```python
drive = GoogleDriveService(reporting_credentials_secret)
slides = GoogleSlidesService(reporting_credentials_secret)
ROOT_REPORT_FOLDER = "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
EFFICIENCY_REPORT_TEMPLATE = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
report_folder_name = f"a_client_name_report_{datetime.datetime.now().timestamp()}".replace(" ", "_")
report_folder = drive.create_folder(report_folder_name, ROOT_REPORT_FOLDER)

## Reading image into a bytes array
with open("/local/path/to/a/file.png, "rb") as image:
  image_bytes = image.read()

efficiency_image = drive.upload_image_to_folder(folder_id=report_folder.id, file_name="efficiency", file_extension="png", data=image_bytes)
drive.make_public(file_id=efficiency_image.id)

report_name = f"a_client_report_name"
report_deck = drive.copy_file_to_folder(original_file_id=REPORT_TEMPLATE, folder_id=report_folder.id, file_name=report_name)

df = read_data_from_database()
filter_options = get_current_filtering_options_from_ui()

efficiency_image_public_url = ???

requests = [
  slides.create_text_replace_request(placeholder="{{customer_id}}", value=df["id"]),
  slides.create_text_replace_request(placeholder="{{customer_name}}", value=df["name"]),
  slides.create_text_replace_request(placeholder="{{customer_address}}", value=df["address"]),
  slides.create_text_replace_request(placeholder="{{customer_country}}", value=df["country"]),
  slides.create_text_replace_request(placeholder="{{filter_from_date}}", value=filter_options.from_date),
  slides.create_text_replace_request(placeholder="{{filter_to_date}}", value=filter_options.to_date),

  slides.create_image_replace_request(placeholder="{{efficiency_graph}}", image_url=efficiency_image_public_url),
]
slides.batch_update(presentation_id=report_deck.id, requests=requests)

drive.remove_public_access(file_id=efficiency_image.id)
```

We build up an array of requests here that we then issue against the `report_deck.id` file using `batch_update`.

There's, one piece missing, we need to create a public URL for the images that we uploaded.

## Create a public URL for uploaded images

This section is where I spent most of my time. By far. And it will end with a hack, that works. I have not seen any other way that works, but I will share how it was _intended_ to work first.

When we uploaded the image for the graph (`efficiency_image = drive.upload_image_to_folder`) I prepared to make this work, as it should already. The `GoogleDriveObject` exposes two properties that are meant to be used for this: `web_content_link` and `web_view_link`.

However, I've seen many people trying to get that to work, and it doesn't. But a nifty little hack does.

Because `GoogleDriveObject` also exposes a `thumbnail_link`. This link can be modified to have higher resolution. Here's a very simple implementation:

```python
def thumbnail_link_higher_resolution(self, resolution: str = "1000") -> str:
  return self.thumbnail_link.replace("=s220", f"=s{resolution}")
```

This will give you an URL that is firstly public, secondly works to be used in Google Slide replace for `replaceAllShapesWithImage`.

### Let's use `` in our script

And with that, it will complete the script... almost.

```python
drive = GoogleDriveService(reporting_credentials_secret)
slides = GoogleSlidesService(reporting_credentials_secret)
ROOT_REPORT_FOLDER = "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
EFFICIENCY_REPORT_TEMPLATE = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
report_folder_name = f"a_client_name_report_{datetime.datetime.now().timestamp()}".replace(" ", "_")
report_folder = drive.create_folder(report_folder_name, ROOT_REPORT_FOLDER)

## Reading image into a bytes array
with open("/local/path/to/a/file.png, "rb") as image:
  image_bytes = image.read()

efficiency_image = drive.upload_image_to_folder(folder_id=report_folder.id, file_name="efficiency", file_extension="png", data=image_bytes)
drive.make_public(file_id=efficiency_image.id)

report_name = f"a_client_report_name"
report_deck = drive.copy_file_to_folder(original_file_id=REPORT_TEMPLATE, folder_id=report_folder.id, file_name=report_name)

df = read_data_from_database()
filter_options = get_current_filtering_options_from_ui()

efficiency_image_public_url = efficiency_image.thumbnail_link_higher_resolution()

requests = [
  slides.create_text_replace_request(placeholder="{{customer_id}}", value=df["id"]),
  slides.create_text_replace_request(placeholder="{{customer_name}}", value=df["name"]),
  slides.create_text_replace_request(placeholder="{{customer_address}}", value=df["address"]),
  slides.create_text_replace_request(placeholder="{{customer_country}}", value=df["country"]),
  slides.create_text_replace_request(placeholder="{{filter_from_date}}", value=filter_options.from_date),
  slides.create_text_replace_request(placeholder="{{filter_to_date}}", value=filter_options.to_date),

  slides.create_image_replace_request(placeholder="{{efficiency_graph}}", image_url=efficiency_image_public_url),
]
slides.batch_update(presentation_id=report_deck.id, requests=requests)

drive.remove_public_access(file_id=efficiency_image.id)
```

## What is missing?

We are now:

1. Creating a folder for the report
1. Uploading images to the folder, and make the images publicly available, and getting the URL to the thumbnail that works
1. Make a copy of the template report to the report folder
1. Making a lot of request objects and then updating them all in one go
1. Removing public access to the images.

What is missing from this picture? Ah, well - the code above does everything in the report folder, and hence the user is left a bit underwhelmed since no report is downloaded.

That is easily fixed since we can make a link to the report and let the user download it, in a format of her choice. Put this method on the `` class. I told you it was going to be handy:

```python
def create_export_link(self, export_format: str) -> str:
  return f"https://docs.google.com/presentation/d/{self.id}/export?format={export_format}&portrait=false&size=A4"
```

### Using the `create_export_link` method

Using that method completes our script, for real. Hey - I'm going to use it twice, just for the heck of it:

```python
drive = GoogleDriveService(reporting_credentials_secret)
slides = GoogleSlidesService(reporting_credentials_secret)
ROOT_REPORT_FOLDER = "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
EFFICIENCY_REPORT_TEMPLATE = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
report_folder_name = f"a_client_name_report_{datetime.datetime.now().timestamp()}".replace(" ", "_")
report_folder = drive.create_folder(report_folder_name, ROOT_REPORT_FOLDER)

## Reading image into a bytes array
with open("/local/path/to/a/file.png, "rb") as image:
  image_bytes = image.read()

efficiency_image = drive.upload_image_to_folder(folder_id=report_folder.id, file_name="efficiency", file_extension="png", data=image_bytes)
drive.make_public(file_id=efficiency_image.id)

report_name = f"a_client_report_name"
report_deck = drive.copy_file_to_folder(original_file_id=REPORT_TEMPLATE, folder_id=report_folder.id, file_name=report_name)

df = read_data_from_database()
filter_options = get_current_filtering_options_from_ui()

efficiency_image_public_url = efficiency_image.thumbnail_link_higher_resolution()

requests = [
  slides.create_text_replace_request(placeholder="{{customer_id}}", value=df["id"]),
  slides.create_text_replace_request(placeholder="{{customer_name}}", value=df["name"]),
  slides.create_text_replace_request(placeholder="{{customer_address}}", value=df["address"]),
  slides.create_text_replace_request(placeholder="{{customer_country}}", value=df["country"]),
  slides.create_text_replace_request(placeholder="{{filter_from_date}}", value=filter_options.from_date),
  slides.create_text_replace_request(placeholder="{{filter_to_date}}", value=filter_options.to_date),

  slides.create_image_replace_request(placeholder="{{efficiency_graph}}", image_url=efficiency_image_public_url),
]
slides.batch_update(presentation_id=report_deck.id, requests=requests)

drive.remove_public_access(file_id=efficiency_image.id)
print(f"Find the PDF version of the report here : {report_deck.create_export_link("pdf")}")
print(f"Find a powerpoint version of the report here : {report_deck.create_export_link("pptx")}")
```

I hope you found this useful.
