[![Build Status](https://travis-ci.org/mariozaizar/language-eml.svg?branch=master)](https://travis-ci.org/mariozaizar/language-eml)
[![Dependency Status](https://david-dm.org/mariozaizar/language-eml.svg)](https://david-dm.org/mariozaizar/language-eml)

# language-eml

Adds Syntax Highlighting for E-Mail files in Atom.

## Install

`Settings` > `Install` > "language-eml" > `enter`

## Development

Contributions are greatly appreciated. Please fork this repository and open a pull request to add snippets, make grammar tweaks, etc.

1. This script links the `language-eml` folder and your Atom packages directory (Ex, `/Users/mariozaiuzar/.atom/packages`).
```sh
./install.sh
```
2. Open `example.eml` file. Select `EML (E-Mail MIME Message)` as syntax (if need it)
2. Do some changes on the code (Ex, `language-eml/grammars/eml.cson`).
4. `cmd` + `shift` + `p` > "Window: Reload" > `enter`
5. Repeat.

## Release

```

apm publish patch # or minor, mayor
```

## References

This code was inspired by:

- https://www.sitepoint.com/how-to-write-a-syntax-highlighting-package-for-atom/
- http://manual.macromates.com/en/language_grammars.html#naming_conventions
- http://flight-manual.atom.io/#package-json
- https://github.com/jgm/highlighting-kate/blob/master/xml/email.xml
