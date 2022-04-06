---
---
---

(prereqs)

# Setting up your local environment - Prerequisites

## Windows

First, set up Windows Subsystem for Linux

- https://docs.microsoft.com/en-us/windows/wsl/install
- First, install WSL. For the purposes of this session, I installed WSL2
- Check your windows version
  - select **Windows logo key + R**, type **winver** and select **OK**
  - You must be running Windows 10 Build 19041 and higher 
- open **PowerShell** or **Windows Command Prompt** and run the following:
  - `wsl --install`
  - You can open the command prompt by clicking the **Windows logo button**
    on the task bar, typing **cmd**, right clicking on **Command Prompt**
    and selecting **Run as administrator**
  - restart your computer
  - check that linux is installed using the Command Prompt:
  - `wsl --list`
  - if it's not, you can install, Ubuntu (or a distribution of your choice)
  - `swl --install -d Ubuntu-20.04`
  - follow the set up instructions and choose a username/password

Install biber:

- type `sudo apt install biber`

Next, install make:

- type `sudo apt install make`

After this, install TeX Live full inside Linux

- Open the start menu by clicking the **Windows logo button** and opening 
  Ubuntu (or whichever Linux distribution you installed).
- This will open a command line. 
  - type in the following and press enter: `sudo apt update`. You may be 
    prompted for your password
  - when this is finished, install TeX Live: `sudo apt install texlive-full`

Finally, install pandoc:

- `sudo apt install pandoc`



## Mac
First, install HomeBrew. This is a "package manager," which allows you to 
install other programs.

- Instructions from: https://brew.sh/
  - Open up a terminal. You can do this by going into launchpad and
    typing in "terminal" and clicking on the icon
  - paste this in and press enter:
    `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

Next, install MacTeX. You can do this through Homebrew by typing the following
into your terminal window:

- `brew install --cask mactex`
- this will take some time, so be patient

Finally, install pandoc:

- ` brew install pandoc`

## Linux

This guide assumes you are running Ubuntu. If you are running another version
of Linux, including a Debian variant, your instructions may differ.

First, install TeX Live

- Open a terminal window. This gives you access to the command line. 
  In **Ubuntu** you can do this by right-clicking 
  on your desktop wallpaper and selecting **open in terminal** or by
  pressing **Ctrl+Alt+T** from anywhere.
- type in the following and press enter: `sudo apt update`. You may be 
  prompted for your password
- when this is finished, install TeX Live: `sudo apt install texlive-full`
- **Troubleshooting**: if `texlive-full` is not installing properly, you
  may want to try installing packages separately. Follow instructions
  listed here: 
  https://www.xmodulo.com/how-to-install-latex-on-ubuntu-or-debian.html

Install biber:

- type `sudo apt install biber`

After this, install make:

- type `sudo apt install make`

Finally, install pandoc:

- `sudo apt install pandoc`

---

# Setting up VS Code

Now that TeX, biber, make, and Pandoc are installed, we are ready to install 
an integrated development environment (IDE). This is the environment where you 
will do your work, e.g. on your manuscript or other LaTeX project.

In this tutorial, we will be using Visual Studio Code, but you will be able
to pick an IDE that best fits your needs. Don't be afraid to try out 
different environments.

## Heads up

- Be sure to install `Visual Studio Code (VS Code)`
- this is different from `Visual Studio`
- this is different from `Visual Studio Mac`

# Windows

Installing VS Code

- download VS Code from https://code.visualstudio.com/download
- Install and run VS Code

Installing the Remote - WSL extension

- VS Code works seamlessly with WSL which you installed earlier
- In VS Code, click on the `extensions` menu. This looks like 4 boxes on the 
  very lefthand side of the window.
- In the extensions tab, search for **wsl**. `Remote - WSL` will be one of 
  the top hits. Click `Install`.

Install VS Code Server in WSL

- Open **Ubuntu** (or your favorite Linux distribution) in Windows.
- In the command line, type `code .` to install VS Code Server
- When installation is complete, a new VS Code window will open.

# Mac

Installing VS Code

- download VS Code from https://code.visualstudio.com/download
- Install and run VS Code

# Linux
These instructions assume you are running Ubuntu or similar.

Install from the command line:

- `sudo snap install --classic code`


--- 
---
---
