# OpenBSD Desktop Starter Kit

This kit contains dotfiles and config files for use with OpenBSD on a desktop or laptop. I use these myself, and created most of them. You're welcome to use them as well, but don't forget to use the man pages.

Once you've finished installation according to the [instructions in the FAQ]() and logged in the first time after booting, you can run the following command to install most of the same tools I use.

~~~
# doas pkg_add -v surf darkhttpd consolekit2 xfce xfce-extras rxvt-unicode quodlibet abcde gimp libreoffice neovim gedit evince claws-mail firefox git ruby haskell-platform ImageMagick feh redshift xscreensaver paper-gtk-theme paper-icon-theme xcursor-themes xcursor-dmz xcursor-neutral scrot zangband snes9x cantarell-fonts fira-fonts hack-fonts inconsolata-font roboto-fonts conky weechat hexchat emacs lbreakout2 lincity-ng moria nethack supertux sumwars freeciv-client freeciv-server omega oolite openttd opentyrian taisei mpd cmus ncmpcpp sonata pngcrush jpegoptim inkscape scrot compton lynx newsbeuter w3m
~~~

This command assumes you've set up ```doas```, which is OpenBSD's replacement for ```sudo```. If not, then you'll want to use ```su``` to become root and run without the "doas" command.

Unfortunately, ```pandoc``` hasn't been ported to OpenBSD yet. You'll need to [set up cabal first](https://deftly.net/posts/2017-10-12-using-cabal-on-openbsd.html).
