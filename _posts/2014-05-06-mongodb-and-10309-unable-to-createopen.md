---
layout: post
title: MongoDb and the "10309 Unable to create/open
lock file" on Ubuntu
date: '2014-05-06T15:33:00.000+02:00' author:
Marcus Hammarberg
tags:
  - Node - Javascript
   - Tools - Life of a
consultant
modified_time: '2014-05-06T15:33:12.579+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-1414687539616327239
blogger_orig_url: http://www.marcusoft.net/2014/05/mongodb-and-10309-unable-to-createopen.html
---


<div dir="ltr" style="text-align: left;" trbidi="on">

Ok, this was about to drive me crazy, and it seems like a lot of people
<a
href="https://www.google.com/search?q=10309+Unable+to+create%2Fopen+lock+file%3A+%2Fdata%2Fdb%2Fmongod.lock+errno%3A13+Permission+denied+Is+a+mongod+instance+already+running%3F%2C+terminating&amp;oq=10309+Unable+to+create%2Fopen+lock+file%3A+%2Fdata%2Fdb%2Fmongod.lock+errno%3A13+Permission+denied+Is+a+mongod+instance+already+running%3F%2C+terminating&amp;aqs=chrome..69i57.727j0j4&amp;sourceid=chrome&amp;es_sm=122&amp;ie=UTF-8"
target="_blank">have run into the same problem</a> but sometimes my
Mongo installation dies on me with an error like this:

> <span style="font-family: Courier New, Courier, monospace;">10309
> Unable to create/open lock file: /data/db/mongod.lock errno:13
> Permission denied Is a mongod instance already running?,
> terminating</span>

Yeah, I didn't get that either. The actual error is not hard to
understand, there's some kind of permission needed on the
/data/db-directory. But why? And how to fix it?


Why... well in my case it was when I had to shut down a running
VirtualBox image by just closing the image window, the equivalent of
pulling the cord of a running computer. So probably Mongo didn't have
time to clean up after itself...

Fix it... yeah, there's a big number of posts on <a
href="http://stackoverflow.com/search?q=10309+Unable+to+create%2Fopen+lock+file"
target="_blank">StackOverflow</a>, take your pick. <a
href="http://stackoverflow.com/questions/7948789/mongodb-mongod-complains-that-there-is-no-data-db-folder"
target="_blank">This tip</a> worked for me:


1.  Check the rights to the /data/db directory by doing "ls -ld
    /data/db". It should be "drwxr-xr-x" if that says something to you.
    Not to me
2.  Change the access rights, if needed by doing "sudo chmod 0755
    /data/db"
3.  And for the user running mongo (in my case myself) "sudo chown -R
    $USER /data/db"
4.  Run "mongod" to start Mongo and verify that it works

<div>

Aaaand after that... It still didn't work. I had to reinstall the whole
thing. <a
href="http://askubuntu.com/questions/147135/how-can-i-uninstall-mongodb-and-reinstall-the-latest-version"
target="_blank">Here's a description</a> on how to clean and reinstall
Mongo. And here's a description <a
href="http://askubuntu.com/questions/197564/how-do-i-add-a-line-to-my-etc-apt-sources-list"
target="_blank">on how to edit /etc/apt/sources.list</a> 

</div>

<div>



</div>


I'm sure this will help me again when I need it! 

</div>
