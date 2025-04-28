# My blog <www.marcusoft.net>

This is my blog. Please leave me feedback or better yet, send me a pull request with some improvements in my GitHub repository.

[Leave me feedback](https://github.com/marcusoftnet/marcusoftnet.github.io/issues/new)

## Tools

During the years I have developed some tools that I've used to handle the blog. You can find them in the [`/scripts` folder](/scripts/). Here's how to use some of them

* [`check-spelling`](/scripts/check-spelling.sh) - this tool spellchecks all the files in a folder. I *so* much wanted that to have been in place earlier... Now it's a lot of work to get it in order.
This script will use the words that you have added to your VS Code settings file, presumed to be located at `$HOME/Library/Application Support/Code/User/settings.json`.

    ```bash
    # Output in the console
    sh scripts/check-spelling.sh _posts

    # Output result to a file
    sh scripts/check-spelling.sh _posts > spelling-results.txt 2>&1
    ```
