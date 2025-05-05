---
layout: post
title: "Config Handling in Node and Heroku - with Secrets"
author: "Marcus Hammarberg"
date: 2015-02-23 07:54:45
tags:
 - Javascript
 - Tools
 - Node
---

After coding and testing a Node application, deploying it to real users becomes a priority. I've previously discussed how to do this quickly and easily with Heroku. However, one aspect that often causes headaches is configuration, especially for environment-specific variables like database connection strings or sensitive information.

## The Configuration Object

I use a simple yet effective object to handle configurations, which I include in almost every project I deploy. Let's dissect it:

```javascript
// Configuration object
var config = {
 local: {
  mode: 'local',
  port: 3000,
  mongoUrl: 'localhost:27017/myApp_Dev',
  user: { name: 'marcus', pass: 'koavote' }
 },
 staging: {
  mode: 'staging',
  port: 4000,
  mongoUrl: 'localhost:27017/myApp_Test',
  user: { name: 'marcus', pass: 'koavote' }
 },
 prod: {
  mode: 'prod',
  port: process.env.PORT || 5000,
  mongoUrl: process.env.MONGOLAB_URI || 'localhost:27017/myApp_Prod',
  user: { name: process.env.BASIC_USER || 'marcus', pass: process.env.BASIC_PASS || 'koavote' }
 }
};
```

This object contains configurations for different environments: local, staging, and production. It also handles sensitive information using environment variables.

## Testing Configuration

Ensuring the correctness of configurations is crucial. Here's an example test suite for our configuration:

```javascript
describe("Configuration", function() {
    describe("Local Configuration", function() {
        var config = require("./config")("local");

        it("loads local configuration default", function(done) {
            config.mode.should.equal("local");
            done();
        });

        it("has all the valid properties", function(done) {
            validateConfig(config);
            done();
        });
    });
});

function validateConfig(config) {
    // Validate configuration properties
}
```

## Secrets, Heroku, and process.env

Using `process.env` allows storing sensitive data outside the code. For instance, Heroku's Config Variables feature lets you configure such values securely. Here's how you can set environment variables:

```bash
node -e 'process.env.MONGOLAB_URI = "myLocalConnectionstring"'
```

On Heroku, these variables can be managed under Settings. Remember not to reveal sensitive information publicly.

## Conclusion

This simple configuration approach, coupled with knowledge of `process.env` and Heroku's features, has proven invaluable in my projects. I typically use it across all applications. However, always ensure sensitive information remains secure and avoid storing secrets in code repositories.
