---
layout: post
title: Compress a string with zip
date: 2008-12-15T14:52:00.002Z
author: Marcus Hammarberg
tags:
  - .NET
  - Life of a consultant
  - C#
modified_time: 2009-01-12T06:57:42.696Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8330905761469245113
blogger_orig_url: https://www.marcusoft.net/2008/12/compress-string-with-zip.html
---

**[UPDATE START]**

We found a nasty performance bug in the code below. The `DeCompress` method copies a string for each turn in the loop. That is a classic problem that creates a new copy of the string for each row. That became a major problem for a 3.8 MB string...

I have now updated the code to use the `System.Text.StringBuilder` object instead. That took down the speed to about a tenth. Sorry that I didn't catch that...

**[UPDATE STOP]**

We had a quite special need the other day; we wanted to compress a part of our request, namely an XML string that was sent to us.

Most of the examples I found on the net showed how to compress the content of a file. But here is the code that compresses a string. The code uses [ICSharpCode.SharpZipLib](http://www.icsharpcode.net/OpenSource/SharpZipLib/). Here you go:

```csharp
/// <summary>
/// Compress strings with ICSharpCode.SharpZipLib
/// </summary>
public class StringZipper
{
    public static string Compress(string uncompressedString)
    {
        byte[] bytData = System.Text.Encoding.UTF8.GetBytes(uncompressedString);
        using (MemoryStream ms = new MemoryStream())
        {
            using (Stream s = new DeflaterOutputStream(ms))
            {
                s.Write(bytData, 0, bytData.Length);
            }
            byte[] compressedData = ms.ToArray();
            return System.Convert.ToBase64String(compressedData, 0, compressedData.Length);
        }
    }

    public static string DeCompress(string compressedString)
    {
        StringBuilder uncompressedString = new StringBuilder();
        byte[] bytInput = System.Convert.FromBase64String(compressedString);
        byte[] writeData = new byte[4096];

        using (Stream s2 = new InflaterInputStream(new MemoryStream(bytInput)))
        {
            int size;
            while ((size = s2.Read(writeData, 0, writeData.Length)) > 0)
            {
                uncompressedString.Append(System.Text.Encoding.UTF8.GetString(writeData, 0, size));
            }
        }
        return uncompressedString.ToString();
    }
}
```

And here is how to call it:

```csharp
// Compress the string
string orgString = "Hello compression with åäö.";
// orgString = File.ReadAllText(args[0]);

Stopwatch sw = new Stopwatch();
sw.Start();
string compressedString = StringZipper.Compress(orgString);
sw.Stop();
string compressTime = sw.ElapsedMilliseconds.ToString();

// Decompress the string
sw.Reset(); sw.Start();
string decompressedString = StringZipper.DeCompress(compressedString);
sw.Stop();
string decompressTime = sw.ElapsedMilliseconds.ToString();

if (orgString == decompressedString)
    Console.WriteLine("SAME");
else
    Console.WriteLine("DIFFER");

decimal ratio = (decimal)compressedString.Length / (decimal)orgString.Length;
Console.WriteLine($"Original string was: {orgString.Length} chars");
Console.WriteLine($"Compressed string was: {compressedString.Length} chars");
Console.WriteLine($"Decompressed string was: {decompressedString.Length} chars");
Console.WriteLine($"Compression ratio {ratio}");
Console.WriteLine($"The compression took {compressTime} ms, Decompression took {decompressTime} ms");
```

I should point out two things:

- For short strings, the compressed string might actually be longer than the original.
- It's not very good to store the result of the compression as a string (as done by `System.Convert.ToBase64String`), but it's quite nice to have for serialization.