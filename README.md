[![Build Status](https://travis-ci.org/mariozaizar/language-eml.svg?branch=master)](https://travis-ci.org/mariozaizar/language-eml)
[![Dependency Status](https://david-dm.org/mariozaizar/language-eml.svg)](https://david-dm.org/mariozaizar/language-eml)

# language-eml

Adds Syntax Highlighting for E-Mail files in Atom.

![screen shot](https://cloud.githubusercontent.com/assets/164819/16852885/cf5d61a4-49be-11e6-9622-a3b4628f5f27.png)

## Supported Filetypes

* `.eml`
* `.email`
* `.mail`
* `.mime`

## Development

Contributions are greatly appreciated.
Please fork this repository and open a pull request to add snippets, make grammar tweaks, etc.

1. Fork & clone from https://github.com/mariozaizar/language-eml.
2. Run `./install.sh` to link the `language-eml` folder and your Atom packages directory (Ex, `/Users/mariozaiuzar/.atom/packages`).
3. Enable the package on Atom (`Settings > Packages > EML > Install`).
4. Open any email (like [example.eml](example.eml)). Select `EML (E-Mail MIME Message)` as syntax.
5. Do some changes on the code (Ex, add more headers to `language-eml/grammars/eml.cson`).
6. `cmd` + `shift` + `p` > "Window: Reload" > `enter`
7. Test your changes.

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
- http://www.phpclasses.org/browse/file/14672.html
