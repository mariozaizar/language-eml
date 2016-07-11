# language-eml

## Syntax Highlighting for E-Mail

## Install

`Settings` > `Install` > "language-eml" > `enter`

## Development

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
