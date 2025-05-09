---
layout: post
title: WCF - wsdl configurations explained
date: 2008-04-11T08:01:00.006Z
author: Marcus Hammarberg
tags:
  - .NET
  - WCF
modified_time: 2008-04-11T17:24:24.634Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8821292909315687787
blogger_orig_url: https://www.marcusoft.net/2008/04/wcf-wsdl-configurations-explained.html
---

OK - after an intensive coding session I can now proudly say that I understand 4 attributes of the WCF configurations (of the 1200 + that exists ;))

The attributes that you should set are:

- **ServiceBehavior.Namespace** - this get generated as the `targetNamepace` in the wsdl (instead of <http://tempuri.org/>). Also you should use this namespace in the endpoint, with the `bindingNamespace`-attribute in the config-file: `<endpoint bindingNamespace="https://www.marcusoft.net/Services/" />`
- **ServiceBehavior.ConfigurationName** - this is the name that you use as service name in the configuration file: `<service name="OffertTjanst" \>`
- **ServiceBehavior.Name** - the name property has solely to do with the generated wsdl-file. It is generated as the Name-attribute in the wsdl-file: `<wsdl:definitions name="ListDataTjanst" ...`
- **ServiceContract.ConfigurationName** - (note: this is on the interface, service contract, all other attributes are on the service implementation) this name is used to reference the interface in the endpoint: `<endpoint address="..." binding="..." contract="OffertContract" />`

As I said at the start. These are the configurations I think are important - and the ones I feel really comfortable with... up to now.
