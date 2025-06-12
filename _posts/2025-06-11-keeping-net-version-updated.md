---
layout: post
title: "Script to keep .NET versions on my Mac updated"
author: "Marcus Hammarberg"
date: 2025-06-11 04:00:00
tags:
 - .NET
 - Programming
---

On my Mac I was struggling to keep different version of .NET updated. I tried Homebrew (which is the Mac-way) but that gave me more problems. I remember reading a [Scott Hanselman post](https://www.hanselman.com/blog/side-by-side-user-scoped-net-core-installations-on-linux-with-dotnetinstallsh) on how to install .NET with a script. And that is [an official way to install .NET](https://learn.microsoft.com/en-us/dotnet/core/install/macos#install-net-with-a-script).

But I wanted to automate this to be run as part of my dotfiles installation. Let me describe what I did.

<!-- excerpt-end -->

## Augmenting script with parameters

The script (`dotnet-install.sh`) takes a few parameters so that you can use different channels (like .NET 6, 8 and 9 for example) and architecture etc. I wanted to write a script that installs the latest supported for several channels. Which can be done with the following commands:

```bash
curl -sSL https://dot.net/v1/dotnet-install.sh | bash -s -- \
  --channel "6.0" \
  --install-dir "$HOME/.dotnet" \
  --arch "arm64" \
  > /dev/null

curl -sSL https://dot.net/v1/dotnet-install.sh | bash -s -- \
  --channel "8.0" \
  --install-dir "$HOME/.dotnet" \
  --arch "arm64" \
  > /dev/null

curl -sSL https://dot.net/v1/dotnet-install.sh | bash -s -- \
  --channel "9.0" \
  --install-dir "$HOME/.dotnet" \
  --arch "arm64" \
  > /dev/null

```

These commands will download the script and then execute it with `bash`. But that's a bit chatty, lets make it tighter with some variables:

```bash
#!/bin/bash
INSTALL_DIR="$HOME/.dotnet"
ARCH="arm64"
SCRIPT_URL="https://dot.net/v1/dotnet-install.sh"
CHANNELS=("6.0" "8.0" "9.0")

for CHANNEL in "${CHANNELS[@]}"; do
  echo "⬇️ Installing $CHANNEL SDK ($LATEST_VERSION)..."
  curl -sSL "$SCRIPT_URL" | bash -s -- \
    --channel "$CHANNEL" \
    --install-dir "$INSTALL_DIR" \
    --arch "$ARCH" \
    > /dev/null
done
```

In fact, let's create a function for the installation-part, which will make overall structure a bit more readable:

```bash
#!/bin/bash

INSTALL_DIR="$HOME/.dotnet"
ARCH="arm64"
SCRIPT_URL="https://dot.net/v1/dotnet-install.sh"
CHANNELS=("6.0" "8.0" "9.0")

# Add to path for script execution
export DOTNET_ROOT="$INSTALL_DIR"
export PATH="$DOTNET_ROOT:$PATH"

# Create install dir if needed
mkdir -p "$INSTALL_DIR"

# Function: install latest SDK from a channel
install_dotnet_channel() {
  local CHANNEL=$1

  echo "⬇️ Installing $CHANNEL SDK ($LATEST_VERSION)..."
  curl -sSL "$SCRIPT_URL" | bash -s -- \
    --channel "$CHANNEL" \
    --install-dir "$INSTALL_DIR" \
    --arch "$ARCH" \
    > /dev/null

  xattr -dr com.apple.quarantine "$INSTALL_DIR"
  echo "✅ Installed new .NET $CHANNEL SDK ($LATEST_VERSION)."
}

# Main loop
for CHANNEL in "${CHANNELS[@]}"; do
  install_dotnet_channel "$CHANNEL"
done
```

After executing this you can run `dotnet --list-sdks` to and see the installed versions.

## Removing old versions

A good start, but this will flood my installation directory with all the minor and patch versions. I don't really care - I just want the latest version of each.

Let's make the script do that. First we introduce a function to find the latest version to use for each channel. We can actually ask `dotnet-install.sh` to get to know that.

```bash
get_latest_version() {
  local CHANNEL=$1
  curl -sSL "$SCRIPT_URL" | bash -s -- --channel "$CHANNEL" --dry-run --install-dir "$INSTALL_DIR" --arch "$ARCH" 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -n 1
}
```

Now we need to remove the version that is not the latest version. First - here's a function that removes all versions except the latest version:

```bash
remove_old_versions() {
  local VERSION=$1
  local MAJOR=$(echo "$VERSION" | cut -d. -f1)
  local KEEP_VERSION=$VERSION

  echo "🧹 Checking for SDKs with major version $MAJOR to clean up (except $KEEP_VERSION)..."

  for sdk in "$INSTALL_DIR/sdk"/*; do
    if [[ -d "$sdk" ]]; then
      sdk_version=$(basename "$sdk")
      sdk_major=$(echo "$sdk_version" | cut -d. -f1)
      if [[ "$sdk_major" == "$MAJOR" && "$sdk_version" != "$KEEP_VERSION" ]]; then
        echo "🗑 Removing $sdk_version"
        rm -rf "$sdk"
      fi
    fi
  done
}
```

Bash is a bit weird to read, in that `local VERSION=$1` is the way to get the first parameter passed to the function. Like this `remove_old_versions "8.0.31"`.

Now we can put that together, with the installation-section we had before. Let's put that in a function too:

```bash
install_dotnet_channel() {
  local CHANNEL=$1
  local LATEST_VERSION=$(get_latest_version "$CHANNEL")

  if [[ -z "$LATEST_VERSION" ]]; then
    echo "❌ Could not determine latest version for $CHANNEL"
    return
  fi

  if [[ ! -d "$INSTALL_DIR/sdk/$LATEST_VERSION" ]]; then
    remove_old_versions "$LATEST_VERSION"
    echo "⬇️ Installing $CHANNEL SDK ($LATEST_VERSION)..."
    curl -sSL "$SCRIPT_URL" | bash -s -- \
      --channel "$CHANNEL" \
      --install-dir "$INSTALL_DIR" \
      --arch "$ARCH" \
      > /dev/null

    xattr -dr com.apple.quarantine "$INSTALL_DIR"
    echo "✅ Installed new .NET $CHANNEL SDK ($LATEST_VERSION)."
  fi
}
```

This function will be called like this `install_dotnet_channel "$CHANNEL"` and do the following:

1. First get the latest version for `$CHANNEL`
1. `if [[ ! -d "$INSTALL_DIR/sdk/$LATEST_VERSION" ]]; then` checks if the latest version is *not* installed.
    1. In that case - we remove all versions that is not `$LATEST_VERSION`
    1. And then install the $CHANNEL latests version, as before.

And with that our script is done:

```bash
#!/bin/bash

INSTALL_DIR="$HOME/.dotnet"
ARCH="arm64"
SCRIPT_URL="https://dot.net/v1/dotnet-install.sh"
CHANNELS=("6.0" "8.0" "9.0")

# Add to path for script execution
export DOTNET_ROOT="$INSTALL_DIR"
export PATH="$DOTNET_ROOT:$PATH"

# Create install dir if needed
mkdir -p "$INSTALL_DIR"

# Function: get latest version from a channel using dry-run
get_latest_version() {
  local CHANNEL=$1
  curl -sSL "$SCRIPT_URL" | bash -s -- --channel "$CHANNEL" --dry-run --install-dir "$INSTALL_DIR" --arch "$ARCH" 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -n 1
}

# Function: remove older SDKs from same major version
remove_old_versions() {
  local VERSION=$1
  local MAJOR=$(echo "$VERSION" | cut -d. -f1)
  local KEEP_VERSION=$VERSION

  echo "🧹 Checking for SDKs with major version $MAJOR to clean up (except $KEEP_VERSION)..."

  for sdk in "$INSTALL_DIR/sdk"/*; do
    if [[ -d "$sdk" ]]; then
      sdk_version=$(basename "$sdk")
      sdk_major=$(echo "$sdk_version" | cut -d. -f1)
      if [[ "$sdk_major" == "$MAJOR" && "$sdk_version" != "$KEEP_VERSION" ]]; then
        echo "🗑 Removing $sdk_version"
        rm -rf "$sdk"
      fi
    fi
  done
}

# Function: install latest SDK from a channel
install_dotnet_channel() {
  local CHANNEL=$1
  local LATEST_VERSION=$(get_latest_version "$CHANNEL")

  if [[ -z "$LATEST_VERSION" ]]; then
    echo "❌ Could not determine latest version for $CHANNEL"
    return
  fi

  if [[ ! -d "$INSTALL_DIR/sdk/$LATEST_VERSION" ]]; then
    remove_old_versions "$LATEST_VERSION"
    echo "⬇️ Installing $CHANNEL SDK ($LATEST_VERSION)..."
    curl -sSL "$SCRIPT_URL" | bash -s -- \
      --channel "$CHANNEL" \
      --install-dir "$INSTALL_DIR" \
      --arch "$ARCH" \
      > /dev/null

    xattr -dr com.apple.quarantine "$INSTALL_DIR"
    echo "✅ Installed new .NET $CHANNEL SDK ($LATEST_VERSION)."
  fi
}

# Main loop
for CHANNEL in "${CHANNELS[@]}"; do
  install_dotnet_channel "$CHANNEL"
done
```

And with that in place it will look amazing during a day when new versions are released:

```bash
🧹 Checking for SDKs with major version 6 to clean up (except 6.0.428)...
🗑 Removing 6.0.427
⬇️ Installing 6.0 SDK (6.0.428)...
✅ Installed new .NET 6.0 SDK (6.0.428).
🧹 Checking for SDKs with major version 9 to clean up (except 9.0.301)...
🗑 Removing 9.0.300
⬇️ Installing 9.0 SDK (9.0.301)...
✅ Installed new .NET 9.0 SDK (9.0.301).
```

## Using as part of my dotfiles

I have all my Mac configuration in a [dotfiles](https://github.com/marcusoftnet/dotfiles) directory. I've based that repository from others [developers greater than me](https://github.com/holman/dotfiles). And for that I'm grateful, because it gave me some tools and conventions that makes it very easy to keep my computer up-date.

After cloning the repository it will be initially setup using the [`bootstrap`](https://github.com/marcusoftnet/dotfiles/blob/master/script/bootstrap) script. After that all configuration will reside in and be dynamically linked to `~/.dotfiles`

One command that gets created is `dot` which will automatically go through all your sub-folders in `~/.dotfiles` and run commands like `install.sh`.

That's a good spot to put our script. I created a `/dotnet/install.sh` script and put the script from above, in there. That means that it will automatically check for new .NET versions every time I run `dot` at the command line.

Pretty neat!
