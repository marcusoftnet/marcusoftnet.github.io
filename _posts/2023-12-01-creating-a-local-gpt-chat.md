---
layout: post
title: "Creating a local Chat GPT - using private data"
author: "Marcus Hammarberg"
date: 2023-10-30 10:35:09
tags:
  - Life of a consultant
  - AI
---

The other day I stumbled on a YouTube video that looked interesting. I've been using Chat GPT quite a lot (a few times a day) in my daily work and was looking for a way to feed some private, data for our company into it.

The title of the video was "PrivateGPT 2.0 - FULLY LOCAL Chat With Docs"

<iframe width="560" height="315" src="https://www.youtube.com/embed/XFiof0V3nhA?si=glu1V_H23ppoZzGV" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

It was both very simple to setup and also a few stumbling blocks. But in the end I could have conversations in English (and broken Swedish) about how to build data pipelines, the [Scling](https:/www.scling.com)-way, by feeding the AI our documentation files.

This is all running locally on my machine without any keys to a third party service.

<!-- excerpt-end -->

I'm going to split this post into two parts; first a description on what I want to and why, then a [section on how I set it up](#getting-it-to-work---installation)

## The need for private GPT

[ChatGPT](https://chat.openai.com/) (or other LLM based chats) has taken the world with storm and the word "paradigm-shift" feels appropriate to describe where are at. But there is a need that I think I'm not alone in having; I want it to know what we know in the company.

Here's my example; I'm a fairly new developer on a platform that contains loads of code, opinions and recommendations that I need to scan the code to know. Or ask a colleague, which gets annoying for both me and people around me after awhile. It's sometimes simple questions like `have anyone else downloaded FTPs in Scala in our platform?`, but can also be a bit more vague `I've never created an integration test on our platform before, can you guide me?`.

To do this I would have create a GPT chat that knows what we know, and hold the same opinions as we when it comes to preferring one solution over another. I want a Scling-Chat-bot.

Turns out that creating one is suprisingly simple - using the [Private GPT](https://www.privategpt.io/) that the video above showed us.

I'm no expert in this field, and the following description is my layman understanding of it... but:

PrivateGPT is a webserver (including an API) that runs locally on your machine (you can run it in a docker, but that seems to be not recommended due to performance / hardware virtualization issues... layman, told you). When setting up your local PrivateGPT server you feed it an LLM, that you download. This is important as it means that you can use whatever LLM you want. For example the [GPT-SW3 Swedish model](https://www.ai.se/en/project/gpt-sw3).

In my understanding the LLM model is what gives PrivateGPT the model to hold conversations, to help it to understand languages, in short. LLM - large language model. GPT - Generative Pre-training Transformer. But that is _general_ knowledge and doesn't know things about our specific world; the Scling-platform, our products, use cases from our support etc.

What makes PrivateGPT very interesting is that you can easily ingest documents ([in MANY formats](https://docs.privategpt.dev/manual/document-management/ingestion#supported-file-formats)) to teach it that missing knowledge. Before I ingest the Scling user documentation into PrivateGPT it would recommend any old framework to parse Excel files in Python. After the ingestion it would make recommendations based on the Scling documentation. (It should be emphasized the the Scling documentation is really good and _have_ recommendations for these things in the form of Architectural decisions :))

And here I'm sure that you can come up with many more examples;

- Before I fed it all documentation about being an employee at X it wouldn't know how to properly report vacation in system Z, but afterwards it would
- Before I fed it all our product user manuals for dishwashers it would come with generic recommendations for washing your clothes, afterwards it would recommend a specific program and tell you how to sort your clothes
- Before I fed it all our customer service FAQs it gave bad answers to common questions, afterwards it could hold long conversations with customers as if it worked in our customer support for years.

But how to do it - let's see. It's not hard, but had a few caveats too.

## Getting it to work - installation

Everything I write from this point on is what I learned from following the [installation page](https://docs.privategpt.dev/installation) of PrivateGPT. If this doesn't work, you should probably go [that page](https://docs.privategpt.dev/installation) and follow their instructions instead.

At the end I will put all of these commands in one file, which will look much like their [quick start](https://docs.privategpt.dev/overview/welcome/quickstart). However, not reading through and understanding the individual steps will cause problems later. Trust me on this...

0. To use PrivateGPT you need:

   - [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
   - [Python 3.11](https://www.python.org/downloads/)
   - [PyEnv](https://github.com/pyenv/pyenv#installation) (not a requirement, but recommended and makes life easier). I struggled with this one, until I found the automatic installer `curl https://pyenv.run | bash` which guided me right
   - [Make](https://docs.privategpt.dev/installation#base-requirements-to-run-privategpt), which is preinstalled on my Linux system. This is needed to be able to do ingestion at the prompt

1. Start by cloning the repository to get the PrivateGPT locally. This is a key feature of using PrivateGPT - you run it locally.

   ```bash
   git clone https://github.com/imartinez/privateGPT
   cd privateGPT
   ```

2. Now use pyenv to install and use the correct version of Python and activate the environment:

   ```bash
   pyenv install 3.11
   pyenv local 3.11
   ```

3. PrivateGPT uses a tool call Poetry to manage dependencies and run commands like start and ingestion. We need to install that into the PyEnv virtual environment. This is how to do that:

   ```bash
   pip install --upgrade pip poetry
   ```

4. Once that Poetry is installed you can start PrivateGPT using the following command, that will install all dependencies. This command will install all dependencies to run PrivateGPT locally:

   ```bash
   poetry install --with ui,local
   ```

5. Start the application using:

   ```bash
   make run
   ```

   or

   ```bash
   poetry run python -m private_gpt
   ```

   You can now see the application running at [http://localhost:8001](http://localhost:8001). But it's using a mock LLM, so once you verified that it works, shut it down again (CTRL+C) and continue

6. Let's download a LLM and the absolutely easiest way to do that is to use PrivateGPTs recommended settings, through the setup script:

   ```bash
   poetry run python scripts/setup
   ```

   This command takes considerable time, but it also downloads a 5 GB file to your disk - the LLM

7. You could now have ChatGPT like conversations with PrivateGPT, but let's ingest some private data into it, before we try it out.

   Ingestion can be done in the [UI of the PrivateGPT web](http://localhost:8001) but you can also do it from the command line (or write your own code that uses the `/ingest/` - API)

   Here's how to ingest all documents (in [many formats](https://docs.privategpt.dev/manual/document-management/ingestion#supported-file-formats)) from a certain folder:

   ```bash
   make ingest /path/to/folder -- --log-file /path/to/log/file.log
   ```

   (There's a `--watch` flag that I didn't use. First it caused some problems with the running web server, and secondly I think that these updates are probably better done offline.)

   This takes some time, as the ingested content needs to be tokenized in a format that PrivateGPT can understand. It took me about 1 min for 3 mb markdown.

8. **Done** You can now start the application again (`make run`)

9. When playing around with this I found the `wipe` command very useful. All the ingested data ends up in a folder called `local_data`. Simply deleting it works, but causes some weirdness in the UI - PrivateGPT has a command for this, so it's better to use it:

   ```bash
   make wipe
   ```

### Once again, as one long command

Here's a single command that sets up a PrivateGPT installation, with parameters for location of the installation and the folder of documents to ingest.

If the file was save to `privateGPTSetup.sh` you can call it with:

```bash
sh privateGPTSetup.sh /privateGPT/Installation /docs/to/ingest
```

```bash
#!/bin/bash
echo "Clone Private GPT to $1"
git clone https://github.com/imartinez/privateGPT $1
cd $1

echo "Setting up PyEnv"
pyenv install 3.11
pyenv local 3.11

echo "Installing poetry"
pip install --upgrade pip poetry

echo "Installing PrivateGPT as local installation"
poetry install --with ui,local

echo "Downloading standard LLM using script/setup"
poetry run python scripts/setup

echo "Ingest all files in $2"
make ingest $2

echo "Ingestion done - Starting application"
make run
echo "Application running at http://localhost:8001"
```

## Summary

With that you can now setup your own PrivateGPT, that doesn't require any keys, or to upload documents to a third party, that you can feed documents to give it knowledge of your data.

A brave new world
