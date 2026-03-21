# MacOS-Like black&white SDDM theme 
![showcase](https://github.com/exxtnd/exxtnd-sddm-theme/blob/main/sddmscreen.jpg)

[README_RU.md](https://github.com/exxtnd/exxtnd-sddm-theme/blob/main/README_RU.md) (RU VERSION)

Black&White minimalistic SDDM theme based on Qt6. This theme inspired by MacOS 26 Tahoe. There is no liquid glass and other trash.

## Features
* Without unnecessary dependencies of KDE, you can install it with any DE/WM
* The avatar changes automatically if there is an image named ``.face.icon`` in your user's home directory. If not, the fallback image will be displayed.
* User's choice when clicking on the avatar
* Quick access to session management
* Other familiar functions


> for best experience you should download and install [Audiowide font from Google Fonts](https://fonts.google.com/specimen/Audiowide?preview.script=Latn)

## Installation
```
git clone https://github.com/exxtnd/exxtnd-sddm-theme

cd exxtnd-sddm-theme

sudo cp -r maclike-theme /usr/share/sddm/themes/ 
```
```
# to apply this theme, you should edit /etc/sddm.conf and /etc/sddm.conf.d/sddm.conf
# if they dont exist, create and copy this into them

[Theme]
Current=maclike-theme 
```
---
#### Structure of this theme
```
/usr/share/sddm/themes/maclike-theme/
├── Main.qml
├── assets
│   ├── avatar.png
│   ├── bg.jpg
│   ├── power.png
│   ├── restart.png
│   ├── session.png
│   └── suspend.png
├── components
│   ├── PasswordField.qml
│   ├── PowerButtons.qml
│   └── UserAvatar.qml
└── theme.conf
```

---
Please report me in «issues» if you’ll see some bugs
