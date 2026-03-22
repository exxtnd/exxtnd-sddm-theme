import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import SddmComponents
import Qt5Compat.GraphicalEffects
Item {
    id: root
    property int currentUserIndex: 0
    property string currentUserName: userModel.data(userModel.index(0, 0), Qt.UserRole + 1) || userModel.lastUser
    property int currentSessionIndex: sessionModel.currentIndex
    width: 1920
    height: 1080
    // FUNC FOR APPLY CUSTOM FONTS
    property string mainFont: {
	   var fonts = Qt.fontFamilies()
	   for (var i = 0; i < fonts.length; i++) { // ⇩ CHANGE FONT HERE TOO
		 if (fonts[i].toLowerCase().indexOf("Audiowide") !== -1) {
		 console.log("found font:", fonts[i])
		 return fonts[i]
		}
	   }
	   console.log("Font not found", config.font || "Sans") //FALLBACK
	   return config.font || "Sans"
    }
    Image {
        id: background
        anchors.fill: parent
        source: config.background || "assets/bg.jpg" // BACKGROUND IMAGE
	     fillMode: Image.PreserveAspectCrop
	     layer.enabled: config.backgroundBlurEnabled === "true"
	     layer.effect: FastBlur {
		   radius: parseInt(config.backgroundBlurRadius) || 20
	 }
  }
 
// DATE
    Text {
        id: dateText
        anchors.horizontalCenter: parent.horizontalCenter
        y: config.dateY || 20
        text: Qt.formatDate(new Date(), config.dateFormat || "ddd, d MMM yyyy") // DATE FORMAT
        font {
	   family: mainFont
	   pixelSize: parseInt(config.dateFontSize) || 40 // DATE FONT SIZE
            bold: true
        }
        color: config.dateColor || "#000000" // DATE FONT COLOR
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

// TIME
    Text {
        id: timeText
        anchors.horizontalCenter: parent.horizontalCenter
        y: config.timeY || 45
        text: Qt.formatTime(new Date(), config.timeFormat || "hh:mm") // TIME FORMAT
        font {
	         family: mainFont
            pixelSize: parseInt(config.timeFontSize) || 220 // TIME FONT SIZE
            bold: false
        }
        color: config.timeColor || "#000000" // TIME FONT COLOR
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

// AVATAR SECTION
    Rectangle {
        id: avatarContainer
        width: parseInt(config.avatarWidth) || 65 // AVATAR WIDTH
        height: parseInt(config.avatarHeight) || 65 // AVATAR HEIGHT
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - (parseInt(config.passwordFieldHeight) || 45) - height - 20
	     radius: Math.min(width, height) / 2
	     color: "transparent"
        Image {
            id: avatarImage
            anchors.fill: parent
            source: {
                for (var i = 0; i <= 10; i++) {
                    var val = userModel.data(userModel.index(currentUserIndex, 0), Qt.UserRole + i)
                    if (val && val.toString().match(/\.(png|jpg|jpeg|svg|face|icon)$/i)) {
                        if (val.toString().indexOf("/usr/share/sddm") !== -1)
                            continue
                        if (val.toString().indexOf("/usr/share/pixmaps") !== -1)
                            continue
                        return val
                    }
                }
                return config.avatarPath || "assets/avatar.png"
            }
	         fillMode: Image.PreserveAspectCrop
	         layer.enabled: true
	         layer.effect: OpacityMask {
		         maskSource: Rectangle {
		           width: avatarImage.width
		           height: avatarImage.height
		           radius: Math.min(width, height) / 2
              }
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: userMenu.visible = !userMenu.visible
            cursorShape: Qt.PointingHandCursor

        }
        Rectangle {
            id: userMenu
            z: 1000
            width: 200
            height: userListView.contentHeight + 20
            x: (avatarContainer.width - width) / 2
            y: -height - 8
            radius: parseInt(config.sessionMenuRadius) || 10
            color: config.sessionMenuColor || "#000000"
            visible: false
            clip: false
            MouseArea {
                id: userMenuBackdrop
                width: root.width * 2
                height: root.height * 2
                x: -root.width
                y: -root.height
                z: -1
                onClicked: userMenu.visible = false
            }
            ListView {
                id: userListView
                anchors {
                    fill: parent
                    margins: 10
                }
                model: userModel
                delegate: ItemDelegate {
                width: parent.width
                height: 30
                font {
                    family: mainFont
                    pixelSize: 16
                }
                contentItem: Text {
                    text: name
                    font: parent.font
                    color: config.sessionMenuFontColor || "#ffffff"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                    color: index === currentUserIndex ? "#4a4a4a" : "transparent" //SELECTED ITEM HIGHLIGHTER
                    radius: parseInt(config.sessionMenuRadius) || 3
                }
                onClicked: {
                    currentUserIndex = index
                    currentUserName = name
                    userMenu.visible = false
                }
            }
        }
      }
    }
  


// PASSWORDFIELD SECTION
    Rectangle {
        id: passwordField
        width: parseInt(config.passwordFieldWidth) || 180 // INPUT FIELD WIDTH
        height: parseInt(config.passwordFieldHeight) || 40 //INPUT FIELD HEIGHT
        radius: parseInt(config.passwordFieldRadius) || 10 // INPUT FIELD ROUNDING
        color: config.passwordFieldColor || "#d4d4d4" // INPUT FIELD COLOR
        border {
            width: parseInt(config.passwordFieldBorderWidth) || 2 //INPUT FIELD BORDER WIDTH
            color: config.passwordFieldBorderColor || "#000000" // INPUT FIELD BORDER COLOR
        }
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 18
        }
        Text {
            id: placeholder
            anchors.centerIn: parent
            text: config.passwordPlaceholder || "ENTER PSWD" // PLACEHOLDER TEXT
            font {
                family: mainFont
                pixelSize: parseInt(config.passwordPlaceholderSize) || 18
            }
            color: config.passwordPlaceholderColor || "#000000" // PLACEHOLDER COLOR
            visible: passwordText.text.length === 0
        }
	   Item {
                anchors.centerIn: parent
                width: parent.width - 38
                height: parent.height
                clip: true
            TextInput {
                id: passwordText
	       anchors.centerIn: parent
                width: parent.width - 30
                height: parent.height - -100
                font {
                    family: mainFont
                    pixelSize: parseInt(config.passwordTextSize) || 31 // PASSWD CHARACTER SIZE
                }
                color: config.passwordTextColor || "#000000" // PASSWD CHARACTER COLOR
                echoMode: TextInput.Password
		           passwordCharacter: "◈" // PASSWD CHARACTER
                maximumLength: 128
	             cursorVisible: false
	             cursorPosition: text.length
                focus: true
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter
	             selectByMouse: false
	             cursorDelegate: Item {
	             }
                Keys.onEnterPressed: {
//                    sddm.login(userModel.lastUser, passwordText.text, sessionModel.currentIndex)
                    sddm.login(userModel.lastUser, passwordText.text, sessionModel.currentIndex)
                passwordText.text = ""
	             }
	             Keys.onReturnPressed: {
//                  sddm.login(userModel.lastUser, passwordText.text, sessionModel.currentIndex)
                    sddm.login(currentUserName, passwordText.text, sessionModel.currentIndex)
                    passwordText.text = ""
	             }
            }
        }
    }

// POWERBUTTONS
    Row {
        id: powerButtons
        anchors {
            top: parent.top
            right: parent.right
            margins: 20
        }
        spacing: 10
        Rectangle {
            id: sessionButton
            width: parseInt(config.buttonSize) || 32
            height: parseInt(config.buttonSize) || 32
            radius: 5
            color: "transparent"
            Image {
                anchors.fill: parent
                source: config.sessionButtonIcon || "assets/session.png" // SESSION BUTTON PICTURE
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                anchors.fill: parent
                onClicked: sessionMenu.visible = !sessionMenu.visible
            }

// SESSION BUTTON
            Rectangle {
                id: sessionMenu
                z: 1000
                width: 260
                height: sessionListView.contentHeight + 20
                x: -width + parent.width
                y: parent.height + 5
                radius: parseInt(config.sessionMenuRadius) || 10
                color: config.sessionMenuColor || "#000000" // SESSION MENU BACKGROUND COLOR
                visible: false
                clip: false
                MouseArea {
                id: sessionMenuBackdrop
                width: root.width * 2
                height: root.height * 2
                x: -root.width
                y: -root.height
                z: -1
                onClicked: sessionMenu.visible = false
                }
                ListView {
                    id: sessionListView
                    anchors {
                        fill: parent
                        margins: 10
                    }
                    model: sessionModel
                    delegate: ItemDelegate {
                        width: parent.width
                        height: 30
                        text: name
                        font {
                            family: mainFont
                            pixelSize: 12
                        }
                        contentItem: Text {
                            text: parent.text
                            font: parent.font
                            color: config.sessionMenuFontColor || "#ffffff" // SESSION MENU FONT COLOR
                            verticalAlignment: Text.AlignVCenter
                        }
                        background: Rectangle {
                            color: index === currentSessionIndex ? "#4a4a4a" : "transparent" //SELECTED ITEM HIGHLIGHTER
                            radius: parseInt(config.sessionMenuRadius) || 3
                        }
                        onClicked: {
                            sessionModel.currentIndex = index
                            currentSessionIndex = index
                            sessionMenu.visible = false
                        }
                    }
                }
            }
        }

// SLEEP BUTTON
        Rectangle {
            id: suspendButton
            width: parseInt(config.buttonSize) || 32
            height: parseInt(config.buttonSize) || 32
            radius: 5
            color: "transparent"
            Image {
                anchors.fill: parent
                source: config.suspendButtonIcon || "assets/suspend.png" // SLEEP BUTTON PICTURE
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                anchors.fill: parent
                onClicked: sddm.suspend()
            }
        }

// RESTART BUTTON
        Rectangle {
            id: restartButton
            width: parseInt(config.buttonSize) || 32
            height: parseInt(config.buttonSize) || 32
            radius: 5
            color: "transparent"
            Image {
                anchors.fill: parent
                source: config.restartButtonIcon || "assets/restart.png" // RESTART BUTTON PICTURE
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                anchors.fill: parent
		onClicked: sddm.reboot()
            }
        }

// POWEROFF BUTTON
        Rectangle {
            id: powerButton
            width: parseInt(config.buttonSize) || 32
            height: parseInt(config.buttonSize) || 32
            radius: 5
            color: "transparent"
            Image {
                anchors.fill: parent
                source: config.powerButtonIcon || "assets/power.png" // POWEROFF BUTTON PICTURE
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                anchors.fill: parent
                onClicked: sddm.powerOff()
            }
        }
    }
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            dateText.text = Qt.formatDate(new Date(), config.dateFormat || "ddd, d MMM yyyy")
            timeText.text = Qt.formatTime(new Date(), config.timeFormat || "hh:mm") 
        }
    }
    Component.onCompleted: {
        passwordText.forceActiveFocus()
    }
}
