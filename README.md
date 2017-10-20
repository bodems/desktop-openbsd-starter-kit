# OpenBSD Desktop Starter Kit

This kit contains dotfiles and config files for use with OpenBSD on a desktop or laptop. I use these myself, and created most of them. You're welcome to use them as well, but don't forget to use the man pages.

Once you've finished installation according to the [instructions in the FAQ](https://www.openbsd.org/faq/) and logged in the first time after booting, you can use the following command to install the packages listed in the installed-packages.txt file.

```doas pkg_add -l installed-packages.txt```

This command assumes you've set up ```doas```, which is OpenBSD's replacement for ```sudo```. If not, then you'll want to use ```su``` to become root and run without the "doas" command.

Unfortunately, ```pandoc``` hasn't been ported to OpenBSD yet. You'll need to [set up cabal first](https://deftly.net/posts/2017-10-12-using-cabal-on-openbsd.html).
