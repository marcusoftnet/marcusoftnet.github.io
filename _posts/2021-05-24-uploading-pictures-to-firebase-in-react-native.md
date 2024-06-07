---
layout: post
title: Uploading pictures to Firebase in React Native
author: "Marcus Hammarberg"
date: 2021-05-24 21:38:21
tags:
  - JavaScript
  - React
  - Programming
---

It was quite some times since I wrote a programming related blog post - but now the time has come (and my programming output is poured at the [Salt protips blog nowadays](https://appliedtechnology.github.io/protips/))

I've ventured a bit into [React Native](https://reactnative.dev/) development and found it very enjoyable, especially in combination with [Firebase stuff](https://firebase.google.com/). But I had a really hard time finding a good example of how to upload files from my phone to the Storage services using [Expo](https://expo.io/). I [found this](https://snack.expo.io/@onrun/firebase-upload-image) but I didn't find it easy to follow as all of the code is in one single file.

So I took the original code and refactored it a tiny bit for better readability. My code [is found here](https://github.com/marcusoftnet/PhotoUploaderFirebase) and in the post I'll walk through some of the things that made me look twice.

<!-- excerpt-end -->

### Setup

The setup was plain and simple by just going:

```bash
expo init FirebaseUploader
```

I then created a project in the [Firebase console](https://console.firebase.google.com/) and also created an app (why are those two separate things?!) to get the keys.

Once that was done I created a `firebase.js` file at the root of my project:

```javascript
import firebase from 'firebase';

const firebaseConfig = {
  ...
};

console.log(firebaseConfig);

let firebaseapp;
if (!firebase.apps.length) {
  firebaseapp = firebase.initializeApp(firebaseConfig);
}
const storage = firebase.storage();

export { storage };
```

To get that to compile you'll need to install the dependency:

```bash
expo install firebase
```

I also added some stuff to protect my API keys, using `dotenv` but it is not important for this blog post. Also, I don't have to use that... I've heard - don't trust it.

### Setting up the initial UI

The initial UI is very simple - just a button to Choose an image:

```javascript
...
export default function App() {
  return (
    <SafeAreaView style={styles.container}>
      <Button title='Choose picture' />
      <ImagesList />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});

```

## Permission

The first thing we need to tackle is to get permission to get a hold of some pictures. This can be from the Camera or the Image Library. The code is very similar.

We do this as the component is initialized using the `useEffect` hook of the `App.js` component:

```javascript
import * as ImagePicker from 'expo-image-picker';
...
useEffect(() => {
  getPermission();
}, []);

const getPermission = async () => {
  if (Platform.OS !== 'web') {
    const { status } =
          await ImagePicker.requestMediaLibraryPermissionsAsync();
    if (status !== 'granted') {
      alert('Sorry, we need camera roll permissions to make this work!');
    }
  }
};
```

That code is straight out of the documentation, gently refactored for readability, for the [ImagePicker-component](https://docs.expo.io/versions/latest/sdk/imagepicker/) and works a treat. If you wanted to use the Camera instead you would use the [`getCameraPermissionsAsync()`](https://docs.expo.io/versions/latest/sdk/imagepicker/#imagepickergetcamerapermissionsasync) function.

### Selecting an image

Picking an image from the image library is equally simple... to start with because that is also straight out of the [documentation](https://docs.expo.io/versions/latest/sdk/imagepicker/)

```javascript
import { useState } from 'react';
import * as ImagePicker from 'expo-image-picker';

export default function App() {
  const [image, setImage] = useState(null);

  const pickImage = async () => {
    let result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.All,
      allowsEditing: true,
      aspect: [4, 3],
      quality: 1,
    });

    console.log(result);

    if (!result.cancelled) {
      setImageUri(result.uri);
    }
  };
};

...
// Call the pickImage function onPress of the button
<Button title='Choose picture' onPress={pickImage} />

```

Ok - that is great. Not only did that select the image but also stored it in the local state state `setImageUri()`. Notice that thing that was stored was the URI of the file - that is the URI to the file on disk. I changed the name of the state from the documentation to reflect that.

## Showing the selected image

Let's put that state into use and show the image:

```javascript
<Image source={{ uri: imageUri }} style={{ width: 300, height: 300 }} />
```

BAH! This is too easy.

##Upload part I - getting the binary

Let's do something a bit more advanced and create a button to upload the picture.

To do this we need to do a little hack first; we need to get hold of the binary for the file since we right now only have the URI. We can't send the URI, the path to our file on disk, to firebase, right? We need to get it into memory.

And this is not something that we get from the ImagePicker, but it's [been requested](https://github.com/expo/expo/issues/2402#issuecomment-443726662) - in the meantime we'll do this:

```javascript
const getPictureBlob = (uri) => {
  // https://github.com/expo/expo/issues/2402#issuecomment-443726662
  return new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.onload = function () {
      resolve(xhr.response);
    };
    xhr.onerror = function (e) {
      console.log(e);
      reject(new TypeError("Network request failed"));
    };
    xhr.responseType = "blob";
    xhr.open("GET", imageUri, true);
    xhr.send(null);
  });
};
```

The first time I saw this I mistook it for the upload to Firebase, but no - this is fetching the data from the local disk.

## Upload part 2 - uploading

With the `getPictureBlob`-function in our toolbelt we can now create a function to upload the binary file to Firebase:

```javascript
import { storage } from './firebase';
import uuid from 'uuid';

...

const uploadImageToBucket = async () => {
  let blob;
  try {
    setUploading(true);
    blob = await getPictureBlob(imageUri);

    const ref = await storage.ref().child(uuid.v4());
    const snapshot = await ref.put(blob);

    return await snapshot.ref.getDownloadURL();
  } catch (e) {
    alert(e.message);
  } finally {
    blob.close();
    setUploading(false);
  }
};
```

I'm using `async/await` since I like the synchronous flow of the code that gives me. You can use the promise-version if you want, of course.

- I'm using the `blob = await getPictureBlob(imageUri);` to get the blob
- Storing the blob in the storage is pretty straight forward by just `storage.ref().child(uuid.v4());`
- The `uuid.v4()` is just a simple way for me to generate an ID for the file.
- I'm setting a `setUploading` to give myself a little flag that I can use to indicate that work is being done.

### Uploading part 3 - the UI

That leaves the UI for uploading. Let's simply hide/show the button or an activity indicator depending on the `uploading`-flag:

```javascript
{
  uploading ? (
    <ActivityIndicator />
  ) : (
    <Button title="Upload" onPress={uploadImageToBucket} />
  );
}
```

Easy!

## Showing the images

Just uploading images is fun and everything - but if we can't see them I don't know what good it is. Let's create an `<ImageList />` component like this:

```javascript
import React, { useEffect, useState } from "react";
import { FlatList, StyleSheet } from "react-native";
import { storage } from "../firebase";
import ListImageItem from "./ListImageItem";

const ImagesList = () => {
  const [urlsUploadedImages, setURLsUploadedImages] = useState(null);

  useEffect(() => {
    setURLsToFilesInBucket();
  }, []);

  const setURLsToFilesInBucket = async () => {
    const imageRefs = await storage.ref().listAll();
    const urls = await Promise.all(
      imageRefs.items.map((ref) => ref.getDownloadURL())
    );
    setURLsUploadedImages(urls);
  };

  return (
    <FlatList
      style={styles.container}
      data={urlsUploadedImages}
      keyExtractor={(item) => item}
      renderItem={({ item }) => <ListImageItem uri={item} />}
    />
  );
};

export default ImagesList;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: "row",
  },
});
```

Here I could have kept the state in the `App.js`-file instead, but for clarity, I kept the state in the list instead.

- I'm using `storage.ref().listAll()` to get a list of references
- I can then `.map` over them and get the URL for each `.getDownloadURL()`
- This URL can then be fed into the component that shows each image
  - I created a [separate component for the image,](https://github.com/marcusoftnet/PhotoUploaderFirebase/blob/main/components/ListImageItem.js) just so that I could style it if I wanted, but it's just a `<Image /> ` tag.

## Conclusion

That was fun! And I learned a lot, but in all honesty, I just combined what other people have shown me already.

Here are some resources that I found useful:

- [This video](https://www.youtube.com/watch?v=XxZO7151HYc&list=WL&index=9)
- [This article on the ImagePicker component](https://docs.expo.io/versions/latest/sdk/imagepicker/)
- [This code listing](https://snack.expo.io/@onrun/firebase-upload-image)

I hope you too found this useful.
