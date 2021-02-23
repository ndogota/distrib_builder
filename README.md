# Distrib Builder

Dristrib Builder is a project where we have to make ManHelper and Script Installer in BASH.

## ManHelper

> Manhelper is a bash script to help people find what you are looking for in a man page. For instance, if you're looking at gcc's man, there's over 3000 possible flags so it's difficult to find the description of a flag.
Otherwise, you may just use our script to read certain part of the manual like its description or its synopsis.
>

## Install

> Install is a bash script to help peoples to installing script in folder, to automate deployment. They can choose between folders detected.
>

### Prerequisites
You will need these things before starting using this script.
```
- Internet Connection
- Debian 10
```

## Installation
The first step is to clone the repository :
```bash
git clone https://rendu-git.etna-alternance.net/module-7284/activity-40376/group-808313 BuildYourOwnDistrib
```
And go to the directory you just clone :
```bash
cd ./BuildYourOwnDistrib
```

## Usage
Now we can start to use the script, if you want to know about usage of script just type :

For the manhelper.sh script :
```bash
./manhelper.sh
```

For the install.sh script :
```bash
./install.sh --info
```

Example of usage :
```bash
./manhelper.sh vim --describe
./manhelper.sh vim --usageflag -h -H
```

![Screen of --describe flag](https://image.noelshack.com/fichiers/2020/42/5/1602881638-screenshot-from-2020-10-16-22-53-19.png "This is a sample image.")

![Screen of --describe flag](
https://i.ibb.co/MDdFz29/Screenshot-from-2020-10-16-22-56-58.png "This is a sample image.")

```bash
./install.sh
```

![Screen of --describe flag](https://i.ibb.co/XpSwbkX/Screenshot-from-2020-10-16-23-04-09.png "This is a sample image.")
