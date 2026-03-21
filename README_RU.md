# MacOS-подобная тема для SDDM
[README.md](https://github.com/exxtnd/exxtnd-sddm-theme/blob/main/README.md) (ENG VERSION)

Чёрно-белая тема для SDDM, сделаная под Qt6. Вдохновлена экраном блокировки MacOS. Тут нет жидкого стекла и прочего мусора.

## Функции
* не привязан к КДЕ, можно поставить в комбинации с каким угодно DE/WM
* аватарка сменяется автоматически, если в домашней директории вашего юзера есть картинка с названием ``.face.icon``. если её нет, будет отображаться fallback картинка
* Можно выбрать юзера кликнув по аватарке
* Возможность смены сессии
* Другой базовый функционал

## Скрин темы
![sddmscreen](https://github.com/user-attachments/assets/645c191e-7037-4dee-bfa7-e01df72200c8)



> для того, чтобы был такой шрифт как на скрине, нужно будет самостоятельно скачать и установить [шрифт Audiowide c Google Fonts](https://fonts.google.com/specimen/Audiowide?preview.script=Latn)

## Установка
```
git clone https://github.com/exxtnd/exxtnd-sddm-theme

cd exxtnd-sddm-theme

sudo cp -r maclike-theme /usr/share/sddm/themes/ 
```
```
# для применения темы, вам надо будет отредактировать /etc/sddm.conf и /etc/sddm.conf.d/sddm.conf
# если их у вас нет, создайте и вставьте в них это:

[Theme]
Current=maclike-theme 
```
----
ели вы заметили баги, критические ошибки или не работоспособность этой темы на каком-то дистрибутиве, отпишите об этом в "Issues"
