### TODO & IDEAS 💡

#### Bugs:
  - [] Fix false positive with UUID regex: `boundary="_000_991b4223462f43de8d26145fa3f82b25mclust2depolocal_"`
  - [] Quoted-Printable decoding doesn't work on the russian.eml fixture (Windows-1251)

```shell
Uncaught Error: Invalid continuation byte
language-eml/node_modules/utf8/utf8.js:131

language-eml → ./node_modules/quoted-printable/bin/quoted-printable -d "=CA=EE=EB=EB=E5=E3=E8"
Invalid continuation byte

Error: failed to decode.
If you think this is a bug in quoted-printable, please report it:
https://github.com/mathiasbynens/quoted-printable/issues/new

Stack trace using quoted-printable@1.0.1:

Error: Invalid continuation byte
    at readContinuationByte (/Users/mzaizar/Code/zendesk/language-eml/node_modules/utf8/utf8.js:131:9)
    at decodeSymbol (/Users/mzaizar/Code/zendesk/language-eml/node_modules/utf8/utf8.js:160:12)
    at Object.utf8decode [as decode] (/Users/mzaizar/Code/zendesk/language-eml/node_modules/utf8/utf8.js:206:17)
    at /Users/mzaizar/Code/zendesk/language-eml/node_modules/quoted-printable/bin/quoted-printable:64:20
    at Array.forEach (native)
    at main (/Users/mzaizar/Code/zendesk/language-eml/node_modules/quoted-printable/bin/quoted-printable:43:11)
    at /Users/mzaizar/Code/zendesk/language-eml/node_modules/quoted-printable/bin/quoted-printable:90:3
    at Object.<anonymous> (/Users/mzaizar/Code/zendesk/language-eml/node_modules/quoted-printable/bin/quoted-printable:116:2)
    at Module._compile (module.js:571:32)
    at Object.Module._extensions..js (module.js:580:10)
```

#### Features
- "Email Preview" feature
  - [ ] Add a setting to split long lines after encoding.
  - [ ] Auto decode before doing email preview.
  - [ ] Add "Save as HTML" as https://github.com/atom/markdown-preview to email preview.
- "Send Email" feature
  - [ ] Be able to send the email using local MTA: `Email (EML)` > `Send email`
  - [ ] Settings to configure MTA command (sendmail, mailx, cp..)
- General:
  - [x] Add PULL_REQUEST_TEMPLATE.md (based on githubs)
  - [x] Improve README, add list of projects who inspired this.
  - [x] Remove `*.emlx`, add `*.mbox` to supported extensions list.
  - [ ] Fix specs. Write real specs.
  - [ ] Lint all code.
- "Autocomplete" feature
  - [ ] API for mxtoolbox.com (send this email to Email Headers analysis)
  - [ ] Use https://atom.io/packages/atom-faker for snippets
