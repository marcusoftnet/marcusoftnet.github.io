---
layout: post
title: "Counting words"
author: "Marcus Hammarberg"
date: 2017-08-24 19:00:21
tags:
 - Programming
---

I got the bash-programming bug. Lately I've been almost making up excuses to dive into another script. For example; the [book I'm writing now](http://oikosofy.com/bungsu-story-book/) is closing into an end. So I thought to myself; wonder how many words there are in there. 

And the little programmer inside me just shouted out:

> That's a script!

In this post I will try to explain how the script that counts all the words in a bunch of word documents. 

<a name='more'></a>

### The script

Here's the script:

```shell
#!/bin/bash
totalNumberOfWords=0

for file in ./docs/*.docx; do 
  wordCount=$(textutil -convert txt -stdout $file | wc -w)
  fileName=${file##*/}

  echo "$fileName has $wordCount words"

  totalNumberOfWords=$((totalNumberOfWords + wordCount))
done  

echo "Total number of words: $totalNumberOfWords"
```

And here is what's happening. 

With the `for`-loop I'm iterating over all the `*.docx` files in the `docs` directory. 

The next line is a little tricky but let's go through it slowly. First the parts, part by part, from the right:

* `wc -w` is using the word count program and count complete words, using the `-w` switch. You can use the same program to count lines. 
* To get the text out of the Word documents we are going to use another program called `textutil`. [This tool converts](https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/textutil.1.html) from and to a number of different formats such as HTML, PDF and Word documents. 
  * Using the `-convert txt` we tell the program to convert to text format
  * We are going to pass it a special switch `-stdout` which is outputting the result of textutil to the console. Without this switch the `textutil` command would create a file in the same directory as the input. 

    Speaking of input...
  * The path of the current file, in the `for` loop, is stored in the `$file` variable and we use that to tell `textutil` which file to convert

Now we understand all the parts and it's time to be a little UNIX-y by chaining the parts together. The output of the `textutil` is sent to the `wc` command, using the pipe `|` command. Basically we're not showing the result of the conversion at the command prompt but rather make it the input to `wc`. 

The result of the whole row, the number of words of the each file, is then stored in a temporary variable `wordCount`, so that we can print it later. 

Finally, I don't want to display the complete file path but just the file name. For this I'm extracting the filename to a separate variable `fileName`. This is probably kosher bash, but I like clarity. This line accomplish this:

```bash
  fileName=${file##*/}
```

Now we're ready to print this row of our little report. Like this:

```shell
  echo "$fileName has $wordCount words"
```

I'm totalling the whole thing together, just because. The syntax to do addition is a bit clunky, but this line makes it happen: 

```shell
totalNumberOfWords=$((totalNumberOfWords + wordCount))
```

With that I'm done and the script can be put to use:

```bash
part01-ch01-the-disaster_07.docx has     3312 words
...
...
part06-ch18-the-end-good-bye_02.docx has     1507 words
Total number of words: 51742
```

Ha! Pretty useful, in fact. 

## Taking parameters

And just when I was done with that I realized that I have +1000 blog posts. Wonder how many words they contain. That's a mix of HTML and Markdown in my posts, since I switched from Blogger to Jekyll a few years back. 

Let's see if we can make this script a bit more generic by passing it a location to check. Getting hold of an argument is super easy in bash. Each argument gets a number and you just prefix it with `$`. First argument is `$1`. 

Here's a super simple example: 

```shell
#!/bin/bash
firstArgument=$1
echo $firstArgument
```

If you call this like this `bash countAllWords.sh apa` it will print `apa`

Awesome - let's pass the directory and file extension to count words in. This makes the significant rows look like this

```shell
#!/bin/bash
dir=$1
ext=$2
...
for file in $dir/*.$ext; do 
   # looping as before
done  
...
```

Nice! Let's try it out by passing in the same arguments as before: `bash countAllWords.sh ./docs docx`. Yes! It works. 

Now, we try it in my [_posts-directory](https://github.com/marcusoftnet/marcusoftnet.github.io/tree/master/_posts), that contains so many files that GitHub refuses to list them all. And for now we filter out the markdown files. Here's the full command I'm running locally:

```shell
bash countAllWords.sh ~/Projects/blog/_posts md
```

Sweet! It works just fine. I've written 200075 words in Markdown.

I tried by switching to `html` and got the count of words for that too (MY GOD - words! What have I done?)

## Just counting

But it reveals a flaw in my design. I'm not following the Unix ideals of making small programs that does one thing only, but that thing good. 

Because I of course want to summarize both Markdown words and HTML words. I could have done that if I could. 

I'll make a new copy of the file and call it `totalNumberOfWordsInFiles.sh`. Then I remove everything that is not needed to find the total number. Here's how it looks then:

```shell
#!/bin/bash
dir=$1
ext=$2
totalNumberOfWords=0

for file in $dir/*.$ext; do 
  wordCount=$(textutil -convert txt -stdout $file | wc -w)
  totalNumberOfWords=$((totalNumberOfWords + wordCount))
done  

echo $totalNumberOfWords
```

Now I can call the new script like this: `totalNumberOfWordsInFiles.sh ~/Projects/blog/_posts md` to only get the total number of words in the markdown files in the directory.  

This means that I now can write another script that summarize both kinds of extension, but I'll leave that as an exercise for you. 

## Summary

Ha! That was fun. Bash programming is fast, fun and rewarding. 

Psst… [This blog](/) contains… 559640 words. Half a million words in 1104 posts. Happy reading.