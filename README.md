# LaTeX-to-png
Export LaTeX equations to PNGs.

This runs on macOS and probably on Linux (haven't tested).

# What is this?

## For what?

For some subjects at university I find it the easiest to learn using learning cards, which I want to have in a digital form (to always have them with me and be able to learn whenever I have some minutes spare). As most of these apps don't support Latex by themselves (thank you Studydrive for not implementing this after telling me a year ago you're working on this), I export formulas or whatever I need to write as an image and crop it. This script does this automatically for you, so you just need a .tex file that compiles to the text you want.

(As I don't want to publish my latex template, you might want to take a look at this for a document containing only your text)

## What does this script do?

The script compiles your LaTeX-Code to pdf, crops the pdf and renders it into an image. The image and LaTeX sourcecode will be exported into your output folder, see [Configure](#Configure).

(Yes, your sourcecode will be copied so if you need to change something later you don't need to write everything from scratch).

# How to use

Make the script executable
```sh
chmod +x build.sh
```

Use the script
```sh
./build.sh <output_name>
```

# Installation

You need the following tools to be installed:
- TexLive for `pdflatex` and `pdfcrop`
- poppler-utils for `pdftoppm`

## TexLive

macOS using [homebrew](https://brew.sh/):
```sh
brew cask install mactex
```
or without bundled apps
```sh
brew cask install mactex-no-gui
```

Linux:
```sh
sudo apt install texlive-full
```

Of course you can use smaller installations but these installations should contain everything you will ever use, so it causes the least problems while compiling. In the end it's up to you how much you want to install.

## poppler-utils

macOS:
```sh
brew install poppler
```

Linux (at least Ubuntu):
```sh
sudo apt update
sudo apt upgrade -y
sudo apt install poppler-utils -y
```

# Configure

Configuration is done inside the script.

You have the following options:
- Set the output folder (make sure it exists)
- change the dpi (default is 3000 to get high-res images even with small fomulas)
- Set a output file for pdflatex console output (default is /dev/null)

# Contribute

I'd be happy to see the following improvements:
- [ ] Confirmation this works fine on Linux
- [ ] Instructions to use this on Windows
- [ ] Instructions to execute this script as run option in [VS Code](https://code.visualstudio.com/)

If you have anything else, just contact me (e.g. by opening an issue), although for now this works for me as I need it.