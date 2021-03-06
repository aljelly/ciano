<div align="center">
  <img class="center" width="80" height="78" src="https://github.com/robertsanseries/ciano/blob/master/data/images/com.github.robertsanseries.ciano.png" alt="Icon">
  <h1 align="center">Ciano</h1>
  <h3 align="center">A simple multimedia file converter.</h3>
  <a href="https://appcenter.elementary.io/com.github.robertsanseries.ciano" target="_blank">
    <img align="center" src="https://appcenter.elementary.io/badge.svg" alt="Get it on AppCenter">
    </a>
</div>

<br/>


<p align="center">
    <img src="https://github.com/robertsanseries/ciano/blob/master/data/images/screenshot.png" alt="Screenshot"> <br>
  <a href="https://github.com/robertsanseries/ciano/issues"> Report a problem! </a>
</p>

<div class="center">
  <h1 align="center"> Informations </h1>
</div>

### Website

- [Visit website](https://robertsanseries.github.io/ciano)

### Description

Ciano is a simple multimedia file converter. Built from the ground up for elementary OS. The easiest way to convert your multimedia files to the most popular formats.

### Application Dependencies 
These dependencies must be present before building
 - `meson (>=0.40)`
 - `valac (>=0.16)`
 - `debhelper (>= 9)`
 - `libgranite-dev`
 - `libgtk-3-dev`
 - `ffmpeg`
 - `imagemMagick`
 
 ### Building

```
git clone https://github.com/robertsanseries/ciano.git && cd ciano
meson build && cd build
meson configure -Dprefix=/usr
ninja
```

### Installation & executing
```
sudo ninja install
com.github.robertsanseries.ciano
```

### Uninstalling

```
sudo ninja uninstall
```


### Contributing

#### Donations
 - If you like Ciano and you want to support its development, consider donating via [PayPal](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=S698J2TUEMT3C).

 - Brasil: Se você gosta de Ciano e quer apoiar seu desenvolvimento, considere doar via [PayPal Brasil](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=FJ2EVELMCFPU6)

#### Development
To help, access the links below:

- [Guide on Code Style](https://github.com/robertsanseries/ciano/wiki/Guide-on-code-style)

- [Proposing Design Changes](https://github.com/robertsanseries/ciano/wiki/Proposing-Design-Changes)

- [Reporting Bugs](https://github.com/robertsanseries/ciano/wiki/Reporting-Bugs)

- [How to Translate Ciano](https://github.com/robertsanseries/ciano/wiki/Translate)

- Application structure

```
.
├── data
│   ├── css
│   └── images
│
├── debian
│
├── languages
│   ├── LINGUAS
│   └── com.github.robertsanseries.ciano.pot
│
├── src
│   ├── configs
│   │   ├── Constants.vala
│   │   └── Properties.vala
│   ├── controllers
│   │   └── ConverterController.vala
│   ├── enums
│   │   ├── ColumnEnum.vala
│   │   └── TypeItemEmum.vala
│   ├── interfaces
│   ├── objects
│   │   └── ItemConversion.vala
│   ├── services
│   │   └── Settings.vala
│   ├── utils
│   │   ├── ArrayUtil.vala
│   │   ├── FileUtil.vala
│   │   ├── StringUtil.vala
│   │   ├── TimeUtil.vala
│   │   └── WidgetUtil.vala
│   ├── view
│   │   └── ConverterView.vala
│   └── widgets
│       ├── DialogConvertFile.vala
│       ├── DialogPreferences.vala
│       ├── HeaderBar.vala
│       ├── ListConversion.vala
│       ├── RowConversion.vala
│       ├── SourceList.vala
│       └── SourceListSidebar.vala
│
├── com.github.robertsanseries.ciano.json
├── meson.build
└── post_install.py
    
```
