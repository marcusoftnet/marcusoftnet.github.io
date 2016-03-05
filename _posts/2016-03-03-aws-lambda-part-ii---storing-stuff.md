---
layout: post
title: "AWS Lambda/Claudia part II - Storing stuff"
author: "Marcus Hammarberg"
date: 2016-03-03 21:04:51
tags:
 - Tools
 - Javascript
 - NodeJs
---

In [my last post](http://www.marcusoft.net/2016/02/first-aws-lamda-steps.html) on [Claudia JS](https://github.com/claudiajs/claudia) we only created a very simple function that echoed some data back to us. Still amazingly cool since that echoing scales to whatever load we will put on it, but a bit meek maybe. 

In this post I wanted to up the ante a little bit and store some data, more specifically in the AWS Document database called [DynamoDb](https://console.aws.amazon.com/dynamodb/home)

<a name='more'></a>
You might want to read up on the basics (creating accounts, what is Claudia etc) in my earlier post. I'll write every step down here but I will not explain it as thorough as last post.

# Dynamo Db? 
<blockquote>Amazon DynamoDB is a fully managed non-relational database service that provides fast and predictable performance with seamless scalability.</blockquote>

Ok - it's a document store just like many others, the only difference is that it's in AWS which means that it plays nicely with other AWS features, like the Lambda functions we're about to write. 

## Create table
Although this is a document store the things that we are storing the documents in are called <code>tables</code>. 

Head on to the [DynamoDb Console](https://console.aws.amazon.com/dynamodb/home) and let's create a new table for the simple user data we are about to store. 

1. Click the "Create table" button
2. Give it a name ("lambda-users") and set a partition key ("userId"). The partition key is kind like the Primary Key, the primary value to index the table on.
3. Click "Create" and you're Done. A new, albeit empty, table has been created for you in the cloud. 

I recommend that you click around in the UI to get to know the tool a bit. Add some data (under Item) for example, or check out the Metrics or Alarms etc. Pretty cool stuff in there. And pretty nice looking too. 

## With the AWS client tools
We can create the table in other ways too. Let me show you just one - the [Amazon Command Line interface](https://aws.amazon.com/cli/). With this tool we can automate and manipulate many of the AWS features you might be using, right from your command line. 

The CLI can be installed (Oh my Lord - another package manager? <code>pip</code> needs to be installed first) [from that site ](https://aws.amazon.com/cli/) and once that is done you might want to check out the [configuration of the tool as well](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-quick-configuration).

If you followed along in the [last post](http://www.marcusoft.net/2016/02/first-aws-lamda-steps.html) we created a configuration file by hand. The <code>aws</code> tool can do that for us, but now that it's in place it will be used. 

Creating the table is now, finally, doable. Note that I'm not saying *easy* but here's the command to set up the same table we used the DynamoDb console to do above: 

    aws dynamodb create-table --table-name lambda-users \
      --attribute-definitions AttributeName=userId,AttributeType=S \
      --key-schema AttributeName=userId,KeyType=HASH \
      --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 \
      --query TableDescription.TableArn --output text 

Yeah, that's a mouthful, but if you squint you can see what is going on. I honestly admit that I don't understand the <code>provisioned-throughput</code>, but I trust [Gojko](http://gjoko.net) that showed me this way. 

Running it shows that it works. You'll have to remove the table you already created of course. 

Nice! Two ways of creating DynamoDb tables. Let's move on.   

# Our code
Now to write the code. We will be using two packages from Google themselves called [dynamodb-doc](https://www.npmjs.com/package/dynamodb-doc), and also [aws-sdk](https://www.npmjs.com/package/aws-sdk) but with a twist... 

## Getting started
Getting started is simple... Here's the commands I ran: 

    mkdir lambdaDynamoDbDemo
    cd lambdaDynamoDbDemo/
    git init .
    npm init
    npm install dynamodb-doc aws-sdk claudia-api-builder -S
    touch index.js

This creates a new directory for our app, sets up git and npm, installs the packages we need and creates an empty file for our application. 

You also need to make sure to include the `index.js` file in the `files` section of `package.json`: `"files": ["*.js"]`. 

## First deploy
I've grown accustomed to deploy a very simple first version of the application, just to the get infrastructure up and running. 

Write a minimal `claudia-api-builder` application like this: 

    /* global require, module */
    var ApiBuilder = require("claudia-api-builder");
    var api = new ApiBuilder();
    
    api.get("/users/{id}", function (request) {
        'use strict';
        var id = request.pathParams.id;
        return "Returning user with id:" + id;
    });
    
    module.exports = api;

Now add two commands to your `scripts` in `package.json`: 

    "scripts": {
        "create" : "claudia create --name lambdaDynamoDbDemo --region us-west-2 --api-module index",
        "deploy" : "claudia update"
    }

Create the lambda function in the cloud with `claudia` using `npm run create`. You can now head to the [API Gateway](https://console.aws.amazon.com/apigateway/), find the URL to your function (see [last post](http://www.marcusoft.net/2016/02/first-aws-lamda-steps.html)) and test your application out. 

I used a `curl` command like this:

    curl https://z7b5697ma9.execute-api.us-west-2.amazonaws.com/latest/users/123

That works with the exciting message: 

    "Returning user with id:123"

Let's access DynamoDb now. Or well.. a little error first.

### The [TypeError: Object #<Object> has no method 'apiConfig'] error
It turned out to be a good idea to deploy something simple first since I got an error. I hope you didn't but here's the error message of mine: 

    [TypeError: Object #<Object> has no method 'apiConfig']

This was because I had forgot the `module.exports = api` line above. Adding it and it works fine. I hope you didn't miss that ^^

The Claudia-guys has promised me to update the error message. You can thank me later...

## The app
Our application is a simple little API that will work like this: 

* POST to `/users` - will store a new user object (userId, name and age for now)
* GET to `/users/{id}` - will return the user with the sent in `id`
* PUT to `/users/{id}` - will replace the user information for user with `id` with the pay load of the request
* DELETE to `/users/{id}` - will simply return the user

## Promises, promises, promises
One more thing... The Google packages doesn't support promises and the `claudia-api-builder` doesn't exposes a `reponse` object in the callbacks. This is a problem. 

At least until you realize that `claudia` do allow you to return a promise and that you can `promisify` all of the API from `dynamodb-doc` using `bluebird`. 

[Bluebird](http://bluebirdjs.com/docs/api/promise.promisify.html) is an amazing little package that simply creates promis-ified versions of the methods you pass to it. 

Let's install bluebird, while we're at it: `npm install bluebird -S`.

Bluebird is simple to use. You can use it for one function at the time: 

    DOC = require("dynamodb-doc");
    var docClient = new DOC.DynamoDB();
    var putPromiseVerion = Promise.promisify(docClient.putItem)
    
    // can now be called as
    putPromiseVersion(params)
        .then(function(data){ console.log(data)});

Or you can `promisify` an entire package, which adds new `async` versions of the packages public functions: 

    DOC = require("dynamodb-doc");
    var docClient = Promise.promisifyAll(new DOC.DynamoDB())
    
    // can now be called as
    docClient.putItemAsync(params)
        .then(function(data){ console.log(data)});

Ok, let's see how we can use this in our code, that uses `claudia-api-builder`, since it allows us to return the promise itself. It's pretty slick actually. 

## The code
Finally. Time to code. Let me introduce a few things first and then I'll list the entire thing afterwards.

You can find the code in [my repo for this blog post](https://github.com/marcusoftnet/lambdaDynamoDbDemo), should you want to clone it.  

### DynamoDb functions
All DynamoDb functions have roughly the same signature `docClient.putItem(params, callback)`. For us, using a promisified version it will look something like `return docClient.putItemAsync(params);`

That `params` also looks very similar. 

* It has an required `TableName` property, which just a is a string with a name. I have a function to return that (see below)
* It has an optional `Item` property which is the item to store. Our model, if you want
* It has an optional `Key` property which is the key to retrieve the element from, in our case it looks like this `Key: { userId: id }` 

The only function that stands out from this is the `updateItem` function. It takes an `UpdateExpression` that specifies the values to update and then a `ExpressionAttributeValues` that lists the values to insert. The whole `params` object looks like this: 

    var params = {
        TableName: getTableName(request),
        Key: {
            userId: request.pathParams.id
        },
        UpdateExpression: "set #name = :n, age = :a",
        ExpressionAttributeNames : {"#name" : "name" },
        ExpressionAttributeValues:{
            ":n":request.body.name,
            ":a":request.body.age
        }
    };

You could also just overwrite the whole item with a new item, like we do in the `POST` case. Could be easier... I wanted to show you this option too.   

(If you wonder about `#name` it's because `name` is a [reserved word in DynamoDb](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ExpressionPlaceholders.html#ExpressionAttributeNames))

### Returning promises
With `claudia-api-builder` we can return promises straight off and hence the final row in our methods can be `return docClient.putItemAsync(params);` which returns the promise to be fulfilled. Claudia-api-builder will wait until the promise returns or fail and then return. 

Or put differently, claudia-api-builder will wait until the callback returns and then return from the api. 

### The getTableName-function
There's a little function called `getTableName` that might leave you wondering.Why not just hard code the table name? Well, [Gojko](http://gojko.net) pointed me to this nifty little trick to make our code more general. 

In the function we are using `request.env.tableName` which picks the table name of the `env` variable, if set (otherwise I just set a default). 

These *stage variables* can be set on the API using the [API Gateway console](https://console.aws.amazon.com/apigateway/):

1. Click you API (`lambdaDynamoDbDemo` if you used the same name as me)
2. Now select the Resource drop down menu and select Stages
3. Select the `latest` stage that `claudia` created for us
4. Select the Stage variables tab
5. Enter a new variable called `tableName` (as in `request.env.tableName`) and enter the name of your table. 

This is pretty cool. This variable will stay with the *latests* stage and you can set other values for other stages. 

### The entire code
You can find the code in [my repo for this blog post](https://github.com/marcusoftnet/lambdaDynamoDbDemo), but for completeness I list the code here: 

    /*global require, module*/
    var ApiBuilder = require('claudia-api-builder'),
        api = new ApiBuilder(),
        Promise = require('bluebird'),
        AWS = require("aws-sdk"),
        DOC = require("dynamodb-doc");
    
    // Create a promisified version of the docClient 
    var docClient = Promise.promisifyAll(new DOC.DynamoDB())
    
    // Export the api 
    module.exports = api;
    
    // Create a new user
    api.post('/users', function(request) {
        'use strict';
        
        var params = {
            TableName: getTableName(request),
            Item: {
                userId: request.body.userId,
                name: request.body.name,
                age: request.body.age
            }
        };
    
        return docClient.putItemAsync(params);
    }, { success: 201 }); // Return HTTP status 201 - Created when successful
    
    // get user for {id}
    api.get('/users/{id}', function(request) {
        'use strict';
        
        // Set up parameters for dynamo
        var params = {
            TableName: getTableName(request),
            Key: {
                userId: request.pathParams.id
            }
        };
    
        // Get the item using our promisified function
        return docClient.getItemAsync(params);
    });
    
    // Create a new user
    api.put('/users/{id}', function(request) {
        'use strict';
        
        var params = {
            TableName: getTableName(request),
            Key: {
                userId: request.pathParams.id
            },
            Item: {
                name: request.body.name,
                age: request.body.age
            }
        };
    
        return docClient.updateItemAsync(params);
        
    }); //200 ok is standard for non-errors
    
    // delete user with {id}
    api.delete('/users/{id}', function(request) {
        'use strict';
        
        // Set up parameters for dynamo
        var params = {
            TableName: getTableName(request),
            Key: {
                userId: request.pathParams.id
            }
        };
    
        // Get the item using our promisified function
        // return a nice little message in the .then-clause
        return docClient.deleteItemAsync(params)
            .then(function(data) {
                return "Deleted user with id '" + id + "'";
            });
    
    }); //200 ok is standard for non-errors
    
    function getTableName(request) {
        return request.env.tableName || "lambda-users";
    };

Phew! That was longer than I thought... but many of the DynamoDb functions are very similar. 

Again: you can get hold of the [code here](https://github.com/marcusoftnet/lambdaDynamoDbDemo).

## The security stuff
Everything you do in AWS is governed by security access policies, roles etc. And praise be [the Architect](https://www.wikiwand.com/en/Architect_(The_Matrix)) for that, because cloud computing is nothing if not the security is in place. 

In our case we need to give the Lambda function access rights to the table we created. This is done by setting up a policy configuration for that allows our Lambda function access to the table we just created. 

In the example below you can see that level of granularity you can go to, allowing only certain features to certain functions etc. 

    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": [
            "dynamodb:DeleteItem",
            "dynamodb:GetItem",
            "dynamodb:PutItem",
            "dynamodb:UpdateItem"
          ],
          "Effect": "Allow",
          "Resource": "*"
        }
      ]
    }

In the `Actions` section we enumerate the actions we are configuring. The `Effect` states what we allow (or deny). And the `Resource` is quite simply the table we will access. We will use `*` (all tables), because writing the table name requires the [ARN format](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-ddb) - which for my table looks like this `arn:aws:dynamodb:us-west-2:430072528539:table/lambda-users` 

Save that file in a new directory called `./policies` and call the file `access-dynamodb.json` (or something like that). 

We will use a feature with `claudia` to help us push this policies as part of the `create`. It means two changes for us; one painful and one easy. The easy part is to update the `create` script to this: 

    "create": "claudia create --name lambdaDynamoDbDemo --region us-west-2 --api-module index  --policies policies"

The sad part is that, in the current version, `claudia` doesn't support an easy way to delete lambda functions. Here's what you need to do: 

* Remove the `claudia.json` file in your project folder. This is where `claudia` keeps track of what has been configured. 
* Go to the [lambda console](https://console.aws.amazon.com/lambda) and delete your function `lambdaDynamoDbDemo`
* Go to the [IAM console](https://console.aws.amazon.com/iam/) and delete the role `lambdaDynamoDbDemo`
* Finally go to the [API Gateway console](https://console.aws.amazon.com/apigateway/) and delete the API called `lambdaDynamoDbDemo`

Phew! That fills me both with joy (of all the stuff that Claudia helps us with) and sadness that there's no delete function yet. Soon.

Now we can recreate our lambda function (and all of the rest) with the policy we just defined: `npm run create`

## Testing
Everything is in place - let's test it. I use `curl` to test my stuff with these scripts. Here's what I want to do: 

2. Create a new user
3. Get the user by id
3. Update the user name
3. Get the user again
4. Remove the user 

Here are the scripts, also found in the `testrun.sh` file in [my repository](https://github.com/marcusoftnet/lambdaDynamoDbDemo)

Replace [API-ID] and [REGION] with your stuff that you can see in the `claudia.json` file claudia creates for you.

*Create new user*

    curl -H "Content-Type: application/json" -X POST -d "{'userId' : '123', 'name' : 'Marcus Hammarberg', 'age' : 43 }" https://[API ID].execute-api.[REGION].amazonaws.com/latest/users

*Get user*
    
    curl -H "Content-Type: application/json" https://[API ID].execute-api.[REGION].amazonaws.com/latest/users/123

*Update user*
    
    curl -H "Content-Type: application/json" -X PUT -d "{'userId' : '123', 'name' : 'Carl Marcus Hammarberg', 'age' : 44 }" https://[API ID].execute-api.[REGION].amazonaws.com/latest/users/123 

*Delete user*

    curl -X DELETE https://[API ID].execute-api.[REGION].amazonaws.com/latest/users/123

It works! Running the commands separately, or the `testrun.sh` script access our function, stores, updates, reads and delete our user. 

# Summary
This post was pretty long but it's also a lot of ground covered. I hope you found it helpful as I learned A LOT writing and coding this.

