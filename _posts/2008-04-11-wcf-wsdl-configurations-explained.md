---
layout: post
title: WCF - wsdl configurations explained
date: '2008-04-11T10:01:00.006+02:00'
author: Marcus Hammarberg
tags:
  - .NET
  - WCF
modified_time: '2008-04-11T19:24:24.634+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-8821292909315687787
blogger_orig_url: http://www.marcusoft.net/2008/04/wcf-wsdl-configurations-explained.html
---

OK - after an intensive coding session i can now proudly say that I
understand 4 attributes of the WCF configurations (of the 1200 + that
exists ;))

The attributes that you should set are:

- **ServiceBehavior.Namespace** - this get generated as the
    targetNamepace in the wsdl (instead of <http://tempuri.org/>). Also
    you should use this namespace in the endpoint, with the
    bindingNamespace-attribute in the config-file:
    \<endpoint
    bindingNamespace="[<span
    style="font-family:courier new;">http://www.marcusoft.net/Services/](http://www.marcusoft.net/Services/)"<span
    style="font-family:courier new;"> /\>
- **ServiceBehavior.ConfigurationName** - this is the name that you
    use as service name in the configuration file:
    \<service name="OffertTjanst"
    \>

- **ServiceBehavior.Name** - the name property has solely to do with
    the generated wsdl-file. It is generated as the Name-attribute in
    the wsdl-file:
    \<wsdl:definitions
    name="ListDataTjanst" ...

- **ServiceContract.ConfigurationName** - (note: this is on the
    interface, service contract, all other attributes are on the service
    implementation) this name is used to reference the interface in the
    endpoint:
    \<endpoint address="..."
    binding="..." contract="OffertContract" /\>

As i said at the start. These are the configurations i think are
important - and the ones i feel really comfortable with... up to now.
