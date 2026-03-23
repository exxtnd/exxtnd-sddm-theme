# MacOS-Like black&white SDDM theme 
![sddmscreen](https://github.com/user-attachments/assets/6b967bfd-bd6f-4c35-aa0d-24ae1c3f95f8)


---
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

## Customizing
You can customize the background, fonts, element colors, and power button icons.

Changing the background:

If you don't want to edit the QML code, simply rename your image to ``bg.jpg`` and move it to the assets folder in the theme directory (overwrite the existing file).

Other images:

To change the default profile picture or other assets, follow the same steps, all images are located in the assets folder.

Advanced customization:

For everything else, you'll need to edit the values in ``Main.qml`` and ``theme.conf``. I’ve added comments in the code to guide you, except for theme.conf, as it doesn't support comments and adding them will break the theme.

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
└── theme.conf
```

---
Please report me in «issues» if you’ll see some bugs
