### Contributing

1. Fork & clone from https://github.com/mariozaizar/language-eml.
2. Run `./install.sh` to link the `language-eml` folder and your Atom packages directory (Ex, `/Users/mariozaiuzar/.atom/packages`).
3. Enable the package on Atom (`Settings > Packages > EML > Install`).
4. Open any email (like [example.eml](spec/fixtures/example.eml)). Select `EML (E-Mail MIME Message)` as syntax.
5. Do some changes on the code (Ex, add more headers to `language-eml/grammars/eml.cson`).
6. `cmd` + `shift` + `p` > "Window: Reload" > `enter`
7. Test your changes manually.
8. Add specs, verify with Travis (if possible)
9. Send Pull Request.
10. Get your changes merged.

## Release

```
apm publish patch # or minor, mayor
```
