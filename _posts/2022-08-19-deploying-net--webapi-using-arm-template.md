---
layout: post
title: Deploying. NET 6 WebAPI using ARM Template
author: Marcus Hammarberg
date: 2022-08-19T09:26:51.000Z
tags:
  - .NET - Programming
  - DevOps
---

I'm putting together a course where I want students to easily deploy their code. Since the course is on .NET 6 WebAPIs (and Entity Framework (core)) I thought that Azure would make a great choice to deploy to.

And nowadays [ARM templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/overview) seems to be the way to go (maybe BICEPs but I'm doing ARM for now).

But I ran into problems, and I wanted to share with you those problems and how I overcame it. Just your normal post on this blog in other words.

<!-- excerpt-end -->

## Creating the API

The course is pretty fast moving and I needed them to be up and running fast, so my idea is to create a very simple, walking skeleton, version of the application; by adding value in a simple `Developers` table. Turns out that is quite a lot of steps involved, that I don't want to take time from the course to do.

If you want to get started you can clone this repo and get the code directly from that.

But we can do it here. Follow along.

1. Make sure you're on .NET 6 (I'm using 6.0.302)
1. Create a new webapi; `dotnet new webapi -o WebAPIExercises`
1. Open it in Visual Studio Code, `code WebAPIExercises`
1. Delete everything `WeatherForcast`-related (when will someone give us a clean start?)
1. Add a `Models` and a `Data`-folder

Time to get cracking by adding a model, it is code-first Entity Framework. Here's my `Developer` model:

```c#
public class Developer
{
  public int Id { get; set; }
  public string Name { get; set; } = string.Empty;
  public string GitHubHandle { get; set; } = string.Empty;
  public string Email { get; set; } = string.Empty;
}
```

Clean as a whistle.

Now, let's hook it up to  Entity Framework by adding this database-context-class, in the `Data`-folder.

```c#
using Microsoft.EntityFrameworkCore;

public class WebAPIExercisesContext : DbContext
{
  public WebAPIExercisesContext(DbContextOptions<WebAPIExercisesContext> options) : base(options) { }

  public DbSet<Developer>? Developers { get; set; }
}
```

(Yes the name of the class is a bit wonky, but it works for me. Ok?)

This requires you to add some packages for EF and SQL:

```bash
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
```

Let's now create a controller for the Developers. It's not many lines of code, so no need to have it generated for us.

I'm adding a GET, GET by id and POST, just to keep it simple for me.

```c#

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

[Route("[controller]")]
[ApiController]
public class DevelopersController : ControllerBase
{
  private readonly WebAPIExercisesContext context;

  public DevelopersController(WebAPIExercisesContext context)
  {
    this.context = context;
  }

  [HttpGet]
  public async Task<ActionResult<List<Developer>>> Get()
  {
    return Ok(await context.Developers.ToListAsync());
  }

  [HttpGet("{id}")]
  public async Task<ActionResult<Developer>> Get(int id)
  {
    var hero = await context.Developers.FindAsync(id);
    if (hero == null)
      return NotFound($"Hero with id '{id}' not found");
    return Ok(hero);
  }

  [HttpPost]
  public async Task<ActionResult<List<Developer>>> AddHero(Developer dev)
  {
    context.Developers.Add(dev);

    await context.SaveChangesAsync();
    return Ok(await context.Developers.ToListAsync());
  }
}
```

Since we are injecting `WebAPIExercisesContext` we need to tell .NET how to get hold of that. Open `Program.cs` and add this:

```c#
// Add services to the container.
// Add it here
builder.Services.AddDbContext<WebAPIExercisesContext>(options =>
{
  options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
});
```

Which in turn mean that we need to add a connection string. I've set up a local database in a [Docker-container](https://hub.docker.com/_/microsoft-mssql-server), but it can be any database server where you can create database in.

Add the connection string in the `appSetting.json`:

```json
"ConnectionStrings": {
  "DefaultConnection": "server=.;database=WebAPIExercisesDb;User Id=sa;Password=[a strong password];"
}
```

(Psst - if you Docker-images doesn't start your password is probably not strong enough...)

Finally - let's add [migrations](https://docs.microsoft.com/en-us/ef/core/managing-schemas/migrations/?tabs=dotnet-core-cli), (install the [CLI tool if you haven't](https://docs.microsoft.com/en-us/ef/core/cli/dotnet)).

Add the `Design` package before running the migration:

```bash
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet ef migrations add InitialCreate
```

And then apply the migration to the database that the connectionstring in `appsettings.json` is pointing to:

```bash
dotnet ef database update
```

Phew! Finally ready - we've built our application. You can test it using `dotnet watch run` and head on to `/swagger/index.html`. In fact I took out the `if (app.Environment.IsDevelopment())` around the Swagger stuff in `Program.cs`.

It works!

## Create repo and push

I then created a local git repository, and pushed it to GitHub.

```bash
dotnet new gitignore
touch ReadMe.md
npx license MIT
git init .
git add .
git commit -m "Initial commit"
```

Then I created a new repo in GitHub and pushed my local repository there:

```
git remote add origin git@github.com:marcusoftnet/WebAPIExercises.git
git branch -M main
git push -u origin main
```

My repository ended up here <https://github.com/marcusoftnet/WebAPIExercises>

## Creating the ARM template

Great! We have a working API - let's deploy it using ARM template. Using an ARM template means that your infrastructure is defined in code. Like a recipe for the cloud provider to cook up later.

If you using Visual Studio code your should add the [Azure Resource Manager Tools](https://marketplace.visualstudio.com/items?itemName=msazurermtools.azurerm-vscode-tools) and additionally the [ARM Template Viewer](https://marketplace.visualstudio.com/items?itemName=bencoleman.armview)

I should also say that it seems like Microsoft is pushing [Bicep-templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview?tabs=bicep) a lot. I haven't looked into that, but it looks like a more C#-y way of doing things. That Bicep-format then compiles to an ARM-template.

I like JSON and with the tools above the experience becomes ok.

Creating an ARM-template from scratch is absolutely possible, but why? Head on over to the [quick-start gallery](https://azure.microsoft.com/en-us/resources/templates/) and find one that is cloest to your need.

I searched for `web sql` and found [this template that seems to be close](https://azure.microsoft.com/en-us/resources/templates/web-app-sql-database/).

Copy the content of [`azuredeploy.json`](https://github.com/Azure/azure-quickstart-templates/blob/master/quickstarts/microsoft.web/web-app-sql-database/azuredeploy.json) and then create a `azuredeploy.json` file in the root of your application folder.

Let's peak into it. Especially cool if you have the [ARM Template Viewer](https://marketplace.visualstudio.com/items?itemName=bencoleman.armview) installed.

The file contains 4 sections:

1. Some meta-data like schema and name etc. Pretty boring stuff
1. `parameters` - this is wicked cool. These are things that we will ask the user of the this template for when deploying it. If you take a look at the thing that you just copied you can see that it can be pretty advanced with set options, validated string formats etc. This will soon be very useful
1. `variables` - this section defines variables that the rest of the file can refer to. Think local variables for this ARM template.
1. `resources` - this is the meat of the file that defines all the resources that the ARM template will created. Expand and read this section and you can see that you can pretty easy make out what is happening. This ARM template will, out of the box, create X resources for us:
    1. A SQL Server `"type": "Microsoft.Sql/servers"`
    1. A database - `"type": "Microsoft.Sql/servers/databases"`.
    1. Some firewall rules `"type": "Microsoft.Sql/servers/firewallRules"`
    1. A server farm - `"type": "Microsoft.Web/serverfarms",`
    1. A web site, in the server farm `"type": "Microsoft.Web/sites",`
    1. A config environment variable, with the connection string to the database - `"type": "Microsoft.Web/sites/config",`
    1. Some application insight components for monitoring - `"type": "Microsoft.Insights/components",`

Setting all of that up by hand would have been horrible.

There's A LOT more to be said about ARM templates, but let's leave if like this.

## Adding the important connection to our code

This is cool, we have now specified the infrastructure that our application is running on. We could even, pretty easy (see below), deploy this. But it would not work.

(This section summarizes hours of head-scratching for me)

Because as it stands now we are not deploying any code to the website. Let's fix that. It's pretty simple, but requires us to add a new section in the `"type": "Microsoft.Web/sites",`-resource.

Find that `resource` element and *inside it* add a new `resource`-array with the following content:

```json
{
  // ...
  "resources": [
    // other resources
    {
      "type": "Microsoft.Web/sites",
      // other web site configuration
      "resources" : [
        {
          "type": "sourcecontrols",
          "apiVersion": "2021-03-01",
          "name": "web",
          "dependsOn": [
            "[resourceId('Microsoft.Web/sites', variables('websiteName'))]"
          ],
          "properties": {
            "repoUrl": "https://github.com/marcusoftnet/WebAPIExercises",
            "branch": "main",
            "isManualIntegration": true
          }
        }
      ],
    },
  ]
}
```

Yes, it's `resources`-inception a bit there, but think about it like this:

- The ARM template defines resources `resources []`
  - One of them is the `website`-resource
    - It too has resources
      - One of them is the `sourcecontrols`-resource that defines properties for how to get the code.

Again - it's shown nicely using the [ARM Template Viewer](https://marketplace.visualstudio.com/items?itemName=bencoleman.armview).

A few more words on what we did here, before we can deploy that sucker!

Notice the `dependsOn`-array in the `website/sourcecontrols`-resource. That uses a `variable` called `variables('websiteName'))`. Not only that, it also calls out to a function that get the generated `resourceId` for the website. All in all that means that the `sourcecontrols` section needs the resourceId for the website and hence `depends` on that being created first.

## Deploying using Azure CLI

Deploying is actually very straight-forward... expect the first step.

All of those resources that we created are grouped together into a *resource group* in Azure. Very good naming there, Azure! Think of this like a container for all your resources.

We need to create one before we can run our deployment.

Log in using the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli):

```bash
az login
az group create --name WebAPIExercisesResources --location eastus
```

We can then call the `azure deploy` command, and pass the template:

```bash
az deployment group create --resource-group WebAPIExercisesResources --template-file azuredeploy.json
```

Now the real value of there `parameters`-section in the `azuredeploy.json`-file comes into play. Running that command will now take you through a wizard and let you set appropriate values for every parameter. Pretty sweet!

```bash
› az deployment group create --resource-group WebAPIExercisesResources --template-file azuredeploy.json
Please provide string value for 'sqlAdministratorLogin' (? for help): marcusoftnet
Please provide securestring value for 'sqlAdministratorLoginPassword' (? for help):
 - Running ..
```

It takes quite some time to run, but it's also creating a lot of coolness behind the scene.

You can also define an `azuredeploy.parameters.json` that fills those parameters out, or create random-values. [Take a look here](https://github.com/Azure/azure-quickstart-templates/blob/master/quickstarts/microsoft.web/web-app-sql-database/azuredeploy.parameters.json)

Once it's done you will be greeted by a wall of JSON... Somewhere in the you might find a URL to your website. Better is to open the [Azure Portal](https://portal.azure.com) and find the created resources there.

Mine was created at <https://websitedofpmnz5w3js4.azurewebsites.net/>. And at <https://websitedofpmnz5w3js4.azurewebsites.net/swagger/index.html> I can see and try out my API.

### Deploy-button

But wait, there is more. Find the resource group you create, and delete it. Yes - delete it.

Then:

- Open the `ReadMe.md`
- Add the following markdown:

    ```markdown
    [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/)
    ```

- URL encode the URL to the [contents of your `azuredeploy.json`-file](https://github.com/marcusoftnet/WebAPIExercises/raw/main/azuredeploy.json), [here for example](https://www.urlencoder.org/)
  - It became `https%3A%2F%2Fgithub.com%2Fmarcusoftnet%2FWebAPIExercises%2Fraw%2Fmain%2Fazuredeploy.json` for me

- Now append this encoded url at the end of the link to the deploy-button, making it into:

    ```markdown
    [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmarcusoftnet%2FWebAPIExercises%2Fmain%2Fazuredeploy.json)
    ```

- Commit and push that to git
- Open the repository at GitHub
- Push the button.
- Appreciate the wizard that now got shown, and that you also can use to deploy your application.
- And the much nicer progress bar...

## Summary

That was a long post, but really it's quite simple in real life:

To deploy an application you need:

- An Azure account. Create one from your GitHub-account.
- A internet accessible repository (at [GitHub for example](https://github.com/marcusoftnet/WebAPIExercises))
- An ARM template - we downloaded [this](https://marketplace.visualstudio.com/items?itemName=bencoleman.armview) stored in a `azuredeploy.json` file.
- Update the template with the `sourcecontrols`-section to point to the correct branch of your repository.
- A resource group to hold your application's resources together:

Deploy using the following commands

```bash
az login
az group create --name [your resource group] --location [your location]
az deployment group create --resource-group [your resource group] --template-file azuredeploy.json
```

Or use the Deploy-button...

BOM! It works!
