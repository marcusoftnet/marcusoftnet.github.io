---
layout: post
title: Log4Net, RollingFile named by Date and the staticLogFileName setting
date: 2011-12-13T12:29:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - Life of a consultant
modified_time: 2011-12-13T12:29:42.279Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3333381899174569140
blogger_orig_url: http://www.marcusoft.net/2011/12/log4net-and-staticlogfilename-element.html
---

We have been chasing some strange logging bugs for a while in my current project. We are using [log4net](http://logging.apache.org/log4net/) to do our logging and it works fine ... until a couple of weeks ago. Some logging didn't occur, in another case we didn't get new files...

The fix is, very simple, but quite surprising and I thought I'll share something on what we did to fix it.

We are using a [RollingFileAppender](http://logging.apache.org/log4net/release/sdk/log4net.Appender.RollingFileAppender.html) and common strategy for how to handle the log files; we're creating a new file for each new date. In order to achieve this we have set the following configuration:

```xml
      <appender name="RollingLogFileAppender" type="log4net.Appender.RollingFileAppender">
         <file value="{a path here}" />
         <appendToFile value="true" />
         <rollingStyle value="Date" />
         <datePattern value="yyyyMMdd" />
         <layout type="log4net.Layout.PatternLayout">
           <conversionPattern value="%date [%thread] %-5level %logger - %message%newline" />
         </layout>
         <filter type="log4net.Filter.LevelRangeFilter">
           <levelMin value="INFO" />
         </filter>
       </appender>
```

OK – nothing strange here really. And actually it worked fine for a long time. But all of a sudden we have ran into the problems I described above.

The solution is simply to add the “staticLogFileName” element to the configuration above, setting the value to false;

```xml
<staticLogFileName value="false" />
```

And with that it started to work again. I found some questions around this on [StackOverflow](http://stackoverflow.com/questions/533804/append-current-date-to-log-file-with-log4net) that was related but not exactly this.

So if you name your RollingFiles logs with log4net with Dates – be sure to include the staticLogFileName = false setting.