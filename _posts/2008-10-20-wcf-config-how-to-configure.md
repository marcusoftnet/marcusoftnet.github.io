---
layout: post
title: 'WCF Config: How to configure wsHttpBinding for
no security'
date: '2008-10-20T11:11:00.001+02:00'
author: Marcus Hammarberg
tags:
  - WCF
modified_time: '2008-10-20T11:11:50.064+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-1325842803821633001
blogger_orig_url: http://www.marcusoft.net/2008/10/wcf-config-how-to-configure.html ---

Yes - I know that this is quite rare but if you want something really
easy in place then this is how to use wsHttpBinding with no security:

> \<service name="FaktureringsTjanst"
>         \<endpoint address=""
> binding="wsHttpBinding"
> bindingConfiguration="myBindingConfigurationWsHttp"
> contract="IContract"
> behaviorConfiguration="FaktureringsTjanstBehavior" /\>
>       \</service\>
>     \</services\>
>
>     \<!-- Bindings --\>
>     \<bindings\>
>       \<wsHttpBinding\>
>         \<binding name="myBindingConfigurationWsHttp"
> maxReceivedMessageSize="500000"
> sendTimeout="00:05:00"
> receiveTimeout="00:05:00"\>
>           \<security mode="None"\>
>             \<message clientCredentialType="None" /\>
>           \</security\>
>         \</binding\>
>       \</wsHttpBinding\>
>     \</bindings\>
