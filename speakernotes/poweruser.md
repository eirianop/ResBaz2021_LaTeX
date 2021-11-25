## Instructor set up

LaTeX Workshop

- enable autobuild on save in VS Code

---

# Quick Overview

## intro

- this is what we're going to do today
    - stop paying for free software
    - use git, have as many collaborators as you like
    - collaborate with Word users without becoming one
        - (show examples of PDFs I've made)
        - (show examples of word docs I've made)
    - why?
        - minimize time to get started
        - make lots of customizations
        - automate, automate, automate
- well known that if you're using LaTeX, a lot of people don't
- how do we work with people using word???
- this is a solution that we have that is easy to run, a good workflow pipeline, so that we can work with people in word

## Do a demo

generate interest

- open file explorer in proper directory
- do a `make pdf`
- generate a single page
    - `make PAGE=2021-11-26 page`
    - `make PAGE=2021-11-26 page-word`
    - not exactly the same, but close enough for collaborators!

Today's session is all about getting started quick

- automate the boring stuff out of the way
- focus on your work

---

## Check if everyone has pre-reqs installed

You should have:

- Make
- TeX Live
- Pandoc
- Biber

If you don't have this, ask for help in chat

- (give it a moment)

Move on to `getting started`, but go slowly, give enough time to catch up


---

# getting started

## Setting up Repo

- open terminal (Ubuntu in Windows)
    - **Windows only**
        - (ask how many people are using Windows)
        - `ln -s /mnt/c/Users/Eirian/Desktop myDesktop`
        - `cd myDesktop`
    - (make a directory for today's session, `ResBas2021_Demo`)
- navigate to https://github.com/eirianop/ResBaz2021_LaTeX
    - click on `code`
    - copy **clone** URL (HTTPS)
- terminal
    - git clone https://github.com/eirianop/ResBaz2021_LaTeX.git
    - (right click to paste URL)
    - `cd` into repo
    - `git checkout poweruser`
- open code
    - (in Windows)
        - `code .`
        - could also just click icon
    - click on icon in other distros, probably

---

# VS Code tour

`TODO`

show opening terminal, generating PDF and viewing it again

Does everyone have VS Code installed?

- refer to `Pre-req_set_up` instructions if not
- give it a moment

VS Code is an *integrated development environment (IDE)*

- the environment where you will do your work (e.g. writing manuscript)
- you should pick an IDE that best fits your needs
- Don't be afraid to try out different IDEs later

Opening VS Code

- OS X -- can just click on the icon 
- Windows - type `code .` from WSL command line or click on icon
  - you need the dot, or a path to another directory, otherwise 
    you will get powershell instead of WSL command line
  - if you open VS Code from clicking on an icon, you will need to 
    open a new WSL window from the green pane at the bottom of the 
    screen
  - you will need to have `Remote - WSL` installed
    if you don't have this, hold on, I'll go over it
- Linux - type `code` in command line or click on icon

## Overview

- from 
  - https://code.visualstudio.com/docs/getstarted/userinterface
- you can have any number of windows open
- you can open folders, rather than individual files
- this is similar to R Studio, where you can open a workspace
- **the best part** -- quickly pick up where you left off. If you quit
  VS Code or shut down your computer, when you open VS Code again, 
  it will re-open all the windows you had open, in the proper directories.
- this minimises time to get started, and helps you focus on your work

### The Activity Bar

- the vertical bar on the very left hand side of the screen
- lets you switch between side bar views and gives you additional context-specific 
  indicators
- you can click an icon on the activity bar to collapse it
  - This is great for reducing distractions in your work environment

### Side bar

Side Bar: Explorer

- this takes you to a file explorer view
- you can see the contents of the directory you are in
- if your directory is version controlled, the explorer will tell you
  which files have been modified, and which are untracked
- if you click on the explorer icon again, it will collapse, giving you
  a lower-distraction enviornment

Side Bar: Search

- you can search the contents of your working directory for text
- it also supports find and replace

Side Bar: Source control

- if you are using a source control management (SCM) tool, this view
  will show modifications since your last commit
- keep an eye on it as we code together later

Side Bar: Run and Debug

- this is for software development, out of scope


Side Bar: Extensions

- VS Code has an extension marketplace.
- There are some official extensions
- Developers can also publish extensions here

Extensions:

- clicking on the Extensions view will show you everything you have installed
- you can find new extensions by using the search bar in the 
  Extensions view
- **if you are on Windows**
  - check to see if you have `Remote - WSL` installed. If not, search for it
    and install.
  - You will need to open VS code once from your WSL command line to finish 
    set up
  - I showed you how to do this earlier in the Ubuntu terminal
  - (give people a moment)
- We need to install `LaTeX Workshop` written by **James Yu**
  - search for `LaTeX` and click install
  - you can also install `LaTeX Utilities`, but it's no longer actively
    maintained. It is an add-on for `LaTeX Workshop` that makes some 
    features a little nicer


### Editor

- The main area to edit your files
- you can open as many files as you like
- `open document.tex`
  - double click it
  - single click opens a *preview*
  - `DEMO` split view
- `minimap` is a high-level overview of the file you have open
  - useful for quick navigation

---

## Demo: compiling with LaTeX Workshop

Save `document.tex`

- this is nice, it works like Overleaf
- ...with some trade-offs
  - show, in file explorer, that LaTeX workshop is dumping garbage into
    our working directory
  - we also miss out on opportunities to make our own customisations
    (which we will see shortly)
  - example: where's the compile to word option? (it's not there)
- `disable autobuild in Settings UI`
  - file -> preferences -> settings

---

### Integrated terminal

We need a new way to build our \LaTeX{} project, 
(like we did in the first demo)

Open integrated terminal 

- open/close it with ``Ctrl+` ``
  - or View -> Terminal
- we will be using this a lot, handy to remember the key combo
- the right hand side of the terminal pane tells you what shell you 
  are running. 
  - if you prefer bash, click the down arrow next to the + and
    open a bash terminal
- you can open multiple terminal windows and navigate between them

---

## Questions before moving on?

Ask me (almost) anything!

---

# Taking notes quickly

## With Markdown!

Scenario

- I am a first year PhD student and I want to take minutes for each meeting
  I have with my supervisor

Goals

- I want to take quick notes (no verbose \LaTeX{} syntax)
- I don't want to re-type everything later

Let's start by jotting down some notes

## Example 01 -- heading and lists

Create a new file, `ex01.md`:

```
# Example 1

Today I am learning how to use \LaTeX{} like a pro.
I have learned the following:

- setting up tools
- compiling to PDF
- compiling to word

I wish I could write \LaTeX{} without knowing \LaTeX{}
```

We've just created a markdown file
  - `show rendered preview in VS Code`
  - Markdown is a lightweight markup language for creating formatted text using a plain-text editor.

It turns out, we can convert this easily to \LaTeX{}
  - `make PAGE=ex01 page`
  - if you want to write your thesis in markdown and convert to \LaTeX{}, there's nothing wrong with that
  - for now, let's do some more examples to get a feel for markdown

## Example 02 -- more headings and lists 

```
# Example 2

Today I am learning how to use \LaTeX{} like a pro.

## I set up tools

- command line tools
- VS Code IDE

## I learned to compile code

1. setting up tools
1. compiling to PDF
1. compiling to word

## I have the following objectives

- [x] learn markdown basics
- [ ] learn more markdown
- [ ] learn about Makefiles
```

Compile and view!

- `make PAGE=ex02 page`

## Example 03 -- tables

```
# Table example 1

| Column 1 Header | Column 2 Header | Column 3 Header |
| --------------- | --------------- | --------------- |
| Row 1 Column 1 | Row 1 Column 2 | Row 1 Column 3 |
| Row 2 Column 1 | Row 2 Column 2 | Row 2 Column 3 |
| Row 3 Column 1 | Row 3 Column 2 | Row 3 Column 3 |
```

We can write this quicker

```
# Table example 2

I only need 3 dashes

| column 1 | column 2 | column 3 |
| --- | --- | --- |
| r1c1 | r1c2 | r1c3 |
| r2c1 | r2c2 | r2c3 |
```

## Example 04 -- images and hyperlinks

```
# Example 4

## Including images

![my figure caption](images/examples/image-a.png)

## Including links

My favorite search engine is [Duck Duck Go](https://duckduckgo.com).


```

## BONUS: Makefile  (skip and come back later)

This looks a little funny. We can fix the image positioning.

First, let's get a little insight as to how these files are being generated

- open terminal
- convert to tex manually
- `pandoc -f markdown -t latex pages/ex04.md > example04.tex`
- open it up and take a look

This is really useful, but there's a few details pandoc doesn't help us with

- need to add start and end of the document, in \LaTeX{}
- fortunately, we already have code in our Makefile for this
  - we haven't talked about this yet
  - it's the tool that makes our lives easy
  - you can think about it like a shell script for now
  - (open and go to convertMD rule, modify it)

modify the call to `pandoc`

```
pandoc -f markdown-implicit_figures -t latex ${PAGES}/$${FROM} >> ${OUT}/${PAGES}/$${TO}; \
```

- The key here is `markdown-implicit_figures`
- recompile and look

## Example 05 -- code, italics, and bold emphasis

```
# Bold

this text is **BOLD**

# Italic

this text is *italic*

if the text doesn't render as italic, we can embed \LaTeX{} 
commands, \textit{like so}

# Code

I can write code `in line`, or I can

```
write code in blocks
```

```

## Example 06 -- footnotes

Open `footnotes.md`

- we won't type all of this up

---

At the end, add these files to `document.tex` and compile all of them

## Example 07 -- speaker notes

for a bit of fun, compile our speakernotes from markdown to PDF

- wait for participants
- show them where speakernotes are on github



Some remarks about our build tool

- talk through logic in Makefile
- .tex is always generated if there's an md file
  - if you don't want this, intervene manually
  - otherwise, tex files will get clobbered
  - you can rewrite this rule by modifying the `Makefile`

## Resources -- getting started with markdown

- https://www.markdownguide.org/basic-syntax/
- https://docs.github.com/en/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax
- https://www.markdownguide.org/extended-syntax/

---

# PAUSE FOR QUESTIONS

We have some options on what to learn next

- tour of build tool (make)
- creating our own rules
- modifying existing rules
- source control plug in

---

# Tour of Makefile

- What is a Makefile?
  - Make is a program that helps you compile code
  - The Makefile describes how this is to be done
  - `open our Makefile`
- What are targets?
  - these are the rules that describe how code can be compiled
    - for example `make pdf`
  - you can also write rules that tidy up your directory
    - for example `make clean`
    - show it cleaning up garbage from LaTeX Workshop
  - If there's time, we can write a target together later
- the Makefile included in our \LaTeX{} template provides several targets
  - do a demo

---

# Demo: writing a Makefile Target

Scenario

- I am a first year PhD student keeping an electronic notebook

Goal

- I want to quickly generate a template for my work today, including
  daily goals

Talk through approach

- want something similar to `make newpage`
- want to add more content into the page template
- first, decide what to add
- next, write a new rule
  - Q? is there anything in here we could use as a template?
  - we know `newpage` is similar
  - copy, paste, and modify
- finally, test it


contents
```
\section{Daily Goals}
\begin{todolist}
    \item[\done] create a new journal entry
\end{todolist}

\section{Reference}

\subsection{Summary}

\subsection{Questions}

\subsection{How This Relates to my Research}

\subsection{New Vocabulary and Concepts}

```

do a live demo creating new rule

- rename target `newpage` to `blank`
- create target `newpage`
- add `note-body.tex` into `template/page-header-footer`

---

# OTHER TOPICS

- demo the Source Control tool

---

# TROUBLESHOOTING

- if git isn't showing any updates, then
  - click refresh button
  - or...
    - open settings
    - `file -> preferences -> settings`
    - search for `git`
    - toggle `Git: Enabled`
- if pandoc says `Unknown option --citeproc`
  - old version, must update
  - assumption: you are on Ubuntu (or Windows)
    - `sudo apt remove pandoc`
    - visit https://github.com/jgm/pandoc/releases/tag/2.16.2
    - download the suitable version for your machine, example:
    - `wget https://github.com/jgm/pandoc/releases/download/2.16.2/pandoc-2.16.2-1-amd64.deb`
    - `sudo dpkg -i pandoc-2.16.2-1-amd64.deb`
- `todolist`s don't render well when converting to ms word
    - this is a current limitation
- participant didn't install biber
    - use natbib for now (doc.tex, style)
    - change `biber` to `bibtex` in Makefile

# Installing Python / support minted

Ubuntu, Windows

- `sudo apt install python-is-python3`
- ensure Pygments is installed
- `sudo apt install python3-pygments`
- `\usepackage[...]{minted}` from style


