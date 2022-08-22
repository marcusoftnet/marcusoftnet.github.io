---
layout: post
title: Compress a string with zip
date: 2008-12-15T15:52:00.002+01:00
author: Marcus Hammarberg
tags:
  - .NET
  - Life of a consultant
  - C#
modified_time: 2009-01-12T07:57:42.696+01:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-8330905761469245113
blogger_orig_url: http://www.marcusoft.net/2008/12/compress-string-with-zip.html ---

**\[UPDATE START\]**

We found a nasty performance bug in the code below. The
DeCompress-method copies a string for each turn in the loop. That is a
classic problem that creates a new copy of the string for each row. That
became a major problem for a 3.8 Mb string...

I have now updated the code to use the System.Text.StringBuilder object
instead. That took down the speed to about a tenth. Sorry that I didn't
catch that...

**\[UPDATED STOP\]**

We had a quite special need the other day; we wanted to compress a part
of our request, namely a XML-string that was sent to us.

Most of the examples I found on the net showed how to compress the
content of a file. But here is the code that compress a string. The code
uses <a href="http://www.icsharpcode.net/OpenSource/SharpZipLib/"
target="_blank">ICSharpCode.SharpZipLib</a>. Here you go:

> /// \<summary\>
> /// Compress strings with ICSharpCode.SharpZipLib
> /// \</summary\>
> public class StringZipper
> {
> public static string Compress(string uncompressedString)
> {
> byte\[\] bytData =
> System.Text.Encoding.UTF8.GetBytes(uncompressedString);
> MemoryStream ms = new MemoryStream();
> Stream s = new DeflaterOutputStream(ms);
> s.Write(bytData, 0, bytData.Length);
> s.Close();
> byte\[\] compressedData = (byte\[\])ms.ToArray();
> return System.Convert.ToBase64String(compressedData, 0,
> compressedData.Length);
> }
>
> public static string DeCompress(string compressedString)
> {
> StringBuilder uncompressedString = new StringBuilder();
> int totalLength = 0;
> byte\[\] bytInput = System.Convert.FromBase64String(compressedString);
> ;
> byte\[\] writeData = new byte\[4096\];
> Stream s2 = new InflaterInputStream(new MemoryStream(bytInput));
> while (true)
> {
> int size = s2.Read(writeData, 0, writeData.Length);
> if (size \> 0)
> {
> totalLength += size;
> uncompressedString.Append(System.Text.Encoding.UTF8.GetString(writeData,
> 0, size));
> }
> else
> {
> break;
> }
> }
> s2.Close();
> return uncompressedString.ToString();
> }
> }

And here is how to call it:

> // Compress the string
> string orgString = "Hello compression with åäö.";
> //orgString = File.ReadAllText(args\[0\]);
>
> Stopwatch sw = new Stopwatch();
> sw.Start();
> string compressedString = StringZipper.Compress(orgString);
> sw.Stop();
> string compressTime = sw.ElapsedMilliseconds.ToString();
>
> // Decompress the string
> sw.Reset(); sw.Start();
> string decompressedString =
> StringZipper.DeCompress(compressedString);
> sw.Stop();
> string decompressTime = sw.ElapsedMilliseconds.ToString();
>
> if (orgString == decompressedString)
> Console.WriteLine("SAME");
> else
> Console.WriteLine("DIFFER");
>
> // Show some nice statistics
> decimal ratio = (decimal)compressedString.Length /
> (decimal)orgString.Length;
> Console.WriteLine(string.Format("Orignal string was: {0} chars",
> orgString.Length));
> Console.WriteLine(string.Format("Compressed string was: {0} chars",
> compressedString.Length));
> Console.WriteLine(string.Format("DeCompressed string was: {0} chars ",
> decompressedString.Length));
> Console.WriteLine(string.Format("Compression ratio {0}", ratio));
> Console.WriteLine(string.Format("The compression took {0} ms,
> DeCompression took {1} ms", compressTime, decompressTime));

I should point out two things;

-   For short strings the compressed string might actually be longer
    than the original.
-   It's not very good to store the result of the compression as a
    string (as done by System.Convert.ToBase64String), but it's quite
    nice to have for serialization.
