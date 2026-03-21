# MacOS-Like black&white SDDM theme 
[README_RU.md]

Black&White minimalistic SDDM theme based on Qt6. This theme inspired by MacOS 26 Tahoe. There is no liquid glass and other trash.

## Features
* Without unnecessary dependencies of KDE 
* User's choice when clicking on the avatar
* Quick access to session management
* Other familiar functions

## Screenshot

Твой скриншот

> for best experience you should download and install [Audiowide font from Google Fonts](https://fonts.google.com/specimen/Audiowide?preview.script=Latn)

## Installation
```
git clone https://github.com/exxtnd/

cd 

sudo cp -r maclike-sddm /usr/share/sddm/themes/ 
```
```
# to apply this theme, you should edit /etc/sddm.conf and /etc/sddm.conf.d/sddm.conf
# if they dont exist, create and copy this into them

[Theme]
Current=maclike-sddm 
```
----
Please report me in «issues» if you’ll see some bugs
