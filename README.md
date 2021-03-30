# app_launcher

## What is it

This is a simple app launcher which you can specify the arguments for the app you want to run.

Currently I packaged an old version of chrome (Chrome 49 32-bit for Windows XP+, Chrome 53 64-bit for MacOS and Linux) which support Flash perfectly.

Old version of chromes were downloaded from [Google Chrome Older Versions Download (Windows, Linux & Mac)](https://www.slimjet.com/chrome/google-chrome-old-version.php) and [/RPMS/myrpms/google](http://orion.lcg.ufrj.br/RPMS/myrpms/google/).

## How to run it

1. Download the corresponding app_launcher from [releases](https://github.com/liudonghua123/app_launcher/releases/latest).
2. Extract some where in your computer.
3. Modify the configs according to your environment (Optional).
4. Double click `app_launcher` to run.

**For Linux users**: You may encounter some chrome crash problems like `libXss.so.1,libappindicator3.so.1 not found` due to the lack of some needed packages. For example, you need to install `libXScrnSaver`, `libappindicator3-gtk3`, `redhat-lsb` using `sudo yum install libXScrnSaver libappindicator3-gtk3 redhat-lsb` in redhat/centos/fedora linux before execute `app_launcher`. For other linux distributions, similar steps maybe needed.

## What's next

- [ ] add icon to the app_launcher executable
- [ ] hide the shell command (detach like daemon)
- [ ] reduce the size of the app

## Some helpful links:

1. https://linuxhint.com/install_google_chrome_centos7/
2. https://www.unixmen.com/fix-google-chrome-stable-depends-libxss1-error/
3. https://blog.csdn.net/f1370335844/article/details/80460071
4. https://blog.csdn.net/pyCrawler/article/details/92766664

## License

MIT License

Copyright (c) 2021 liudonghua
