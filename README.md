[![Build Status](https://travis-ci.org/mariozaizar/language-eml.svg?branch=master)](https://travis-ci.org/mariozaizar/language-eml)
[![Dependency Status](https://david-dm.org/mariozaizar/language-eml.svg)](https://david-dm.org/mariozaizar/language-eml)
[![GitHub issues](https://img.shields.io/github/issues/mariozaizar/language-eml.svg)](https://github.com/mariozaizar/language-eml/issues)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/mariozaizar/language-eml/master/LICENSE.md)
[![Twitter](https://img.shields.io/twitter/url/https/github.com/mariozaizar/language-eml.svg?style=social)](https://twitter.com/intent/tweet?text=EML%20Language%20support%20for%20%40Atom%20editor%3A%20https%3A%2F%2Fatom.io%2Fpackages%2Flanguage-eml%20via%20%40mariozaizar&url=%5Bobject%20Object%5D)

# Email support for Atom

Adds syntax highlighting, snippets, shortcuts, and commands to Email files in Atom.

![screen shot 2017-03-15 at 4 04 39 pm](https://cloud.githubusercontent.com/assets/164819/23974678/b8134482-0999-11e7-8af7-a10b1cbd7711.png)

## Features

* Grammar:
  * [Syntax highlighting](#eml-grammar) for `.eml`, `.msg`, `.mbx` and `.mbox` files.
* Snippets:
  * [Plain-Text email template](#eml-snippets-basic).
  * HTML email template.
  * [Multipart email template](#eml-snippets-multipart).
  * Attachments email template.
* Commands:
  * [Preview email](#eml-preview).
  * [To decode/encode base64](#eml-decode-base64).
  * [To decode/encode quoted-printable](#eml-quote-printable-decode).
* Keymaps (shortcuts):
  * <kbd>ctrl-alt-1</kbd> for email preview.
  * <kbd>ctrl-alt-2</kbd> for quoted-printable decode.
  * <kbd>ctrl-alt-3</kbd> for base64 decode.

## Install

> :mouse: https://atom.io/packages/language-eml

Preferences → Install → Search `language-eml` package

![eml install](https://cloud.githubusercontent.com/assets/164819/23042201/988b15f2-f44c-11e6-833a-99e6503718b9.gif)

> :bulb: Sublime Text users, check: https://packagecontrol.io/packages/EML%20(E-Mail)

## Development

Contributions are greatly appreciated. Please follow our [Contributing Guide](CONTRIBUTING.md).

> :mouse: https://github.com/mariozaizar/language-eml/

## References

Email:
- Email basics: https://en.wikipedia.org/wiki/Email
- Multipurpose Internet Mail Extensions (MIME): https://en.wikipedia.org/wiki/MIME
- QP encoding: https://en.wikipedia.org/wiki/Quoted_printable
- Base64 encoding: https://en.wikipedia.org/wiki/Base64
- Content Media Types: http://www.iana.org/assignments/media-types/media-types.xhtml
- Mbox: https://en.wikipedia.org/wiki/Mbox

Atom and Node related:
- manual: http://flight-manual.atom.io/
- api: https://atom.io/docs/api
- autocomplete: https://github.com/atom/autocomplete-plus/wiki/Provider-API
- Keymaps: https://atom.io/docs/latest/behind-atom-keymaps-in-depth
- Guide: https://github.com/blog/2231-building-your-first-atom-plugin

Misc:
- https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe
- https://github.com/leemunroe/responsive-html-email-template
- https://templates.mailchimp.com/

Tools:
- Email Header Analyzer: https://mxtoolbox.com/Public/Tools/EmailHeaders.aspx
- MIME checker: http://mime.ritey.com/
- CHANGELOG generator: https://github.com/skywinder/github-changelog-generator

Awesome projects:
- https://github.com/atom/markdown-preview
- https://github.com/extesy/atom-text-manipulation
- https://github.com/mjmlio/atom-mjml-preview
- https://github.com/mathiasbynens/quoted-printable
- https://github.com/mathiasbynens/windows-1251
- https://github.com/sonim1/regex-filter-and-generator
- https://github.com/webBoxio/atom-html-preview (deprecated)

## Screenshots

*[Preview email](#eml-preview)*
![eml preview](https://cloud.githubusercontent.com/assets/164819/23978557/e6e62618-09b1-11e7-97be-7da1b902b38a.gif)

*[Syntax highlighting](#eml-grammar)*
![eml grammar](https://cloud.githubusercontent.com/assets/164819/23042206/9e354360-f44c-11e6-92d4-5ea9e90e2af6.gif)

*[Plain-Text email template](#eml-snippets-basic)*
![eml snippets basic](https://cloud.githubusercontent.com/assets/164819/23042214/a409a538-f44c-11e6-8182-7c11a0466a78.gif)

*[Multipart email template](#eml-snippets-multipart)*
![eml snippets multipart](https://cloud.githubusercontent.com/assets/164819/23042220/a6e7c5f0-f44c-11e6-961e-4e78a0bca9f4.gif)

*[Base64 encoding](#eml-decode-base64)*
![eml decode base64](https://cloud.githubusercontent.com/assets/164819/23042222/aa6dc774-f44c-11e6-8645-f0428c2b4577.gif)

*[QP encoding](#eml-quote-printable-decode)*
![eml quote-printable decode](https://cloud.githubusercontent.com/assets/164819/23193032/a48cb3b6-f85b-11e6-8e86-1da3ddff09bf.gif)

*Custom settings*
![eml settings](https://cloud.githubusercontent.com/assets/164819/23042236/b241d3e6-f44c-11e6-9ec6-be14742cd6de.gif)
