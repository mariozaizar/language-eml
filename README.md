[![Build Status](https://travis-ci.org/mariozaizar/language-eml.svg?branch=master)](https://travis-ci.org/mariozaizar/language-eml)
[![Dependency Status](https://david-dm.org/mariozaizar/language-eml.svg)](https://david-dm.org/mariozaizar/language-eml)
[![GitHub issues](https://img.shields.io/github/issues/mariozaizar/language-eml.svg)](https://github.com/mariozaizar/language-eml/issues)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/mariozaizar/language-eml/master/LICENSE.md)
[![Twitter](https://img.shields.io/twitter/url/https/github.com/mariozaizar/language-eml.svg?style=social)](https://twitter.com/intent/tweet?text=EML%20Language%20support%20for%20%40Atom%20editor%3A%20https%3A%2F%2Fatom.io%2Fpackages%2Flanguage-eml%20via%20%40mariozaizar&url=%5Bobject%20Object%5D)

# Email support for Atom

Adds syntax highlighting, snippets, shortcuts, and commands to Email files in Atom.

## Features

* Grammar:
  * [Syntax highlighting for Emails files (*.eml, *.emlx, *.msg, *.mbx)](eml-grammar)
* Snippets:
  * [Plain-Text email template](eml-snippets-basic).
  * HTML email template.
  * [Multipart email template](eml-snippets-multipart).
  * Attachments email template.
* Commands:
  * [Preview email](eml-preview).
  * [To decode/encode base64](eml-decode-base64).
  * [To decode/encode quoted-printable](eml-quote-printable-decode).

## Install

Preferences → Install → Search `language-eml` package

![eml install](https://cloud.githubusercontent.com/assets/164819/23042201/988b15f2-f44c-11e6-833a-99e6503718b9.gif)

> :bulb: Sublime Text users, check: https://packagecontrol.io/packages/EML%20(E-Mail)

## Development

Contributions are greatly appreciated. Please follow our [Contributing Guide](CONTRIBUTING.md).

## References

Email:
- Email basics: https://en.wikipedia.org/wiki/Email
- Multipurpose Internet Mail Extensions (MIME): https://en.wikipedia.org/wiki/MIME
- QP encoding: https://en.wikipedia.org/wiki/Quoted_printable
- Base64 encoding: https://en.wikipedia.org/wiki/Base64
- Content Media Types: http://www.iana.org/assignments/media-types/media-types.xhtml

Atom and Node related:
- http://flight-manual.atom.io/
- https://atom.io/docs/api
- https://github.com/extesy/atom-text-manipulation
- https://github.com/atom/autocomplete-plus/wiki/Provider-API
- https://github.com/sonim1/regex-filter-and-generator
- https://github.com/mathiasbynens/quoted-printable

Misc:
- https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe
- https://github.com/leemunroe/responsive-html-email-template
- https://templates.mailchimp.com/

Tools:
- Email Header Analyzer: https://mxtoolbox.com/Public/Tools/EmailHeaders.aspx
- MIME checker: http://mime.ritey.com/

## Example

*Example of EML file*
```eml
Message-ID: <CO1PR02MB254D56B6A11BA5FA73E2476BFDD0@CO1PR02MB254.namprd02.prod.example.com>
From: Mario Zaizar <mariozaizar@example.com>
To: Mario Zaizar <mariozaizar@example.com>
Subject: Testing MIME 1.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=frontier

This is a message with multiple parts in MIME format.
--frontier
Content-Type: text/plain

This is the body of the message.
--frontier
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgPC9oZWFkPgogIDxib2R5PgogICAgPHA+VGhpcyBpcyB0aGUg
Ym9keSBvZiB0aGUgbWVzc2FnZS48L3A+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==
--frontier--
```

## Screenshots

*[Syntax highlighting](#eml-grammar)*
![eml grammar](https://cloud.githubusercontent.com/assets/164819/23042206/9e354360-f44c-11e6-92d4-5ea9e90e2af6.gif)

*[Preview email](#eml-preview)*
![eml preview]()

*[Plain-Text email template](eml-snippets-basic)*
![eml snippets basic](https://cloud.githubusercontent.com/assets/164819/23042214/a409a538-f44c-11e6-8182-7c11a0466a78.gif)

*[Multipart email template](eml-snippets-multipart)*
![eml snippets multipart](https://cloud.githubusercontent.com/assets/164819/23042220/a6e7c5f0-f44c-11e6-961e-4e78a0bca9f4.gif)

*[Base64 encoding](eml-decode-base64)*
![eml decode base64](https://cloud.githubusercontent.com/assets/164819/23042222/aa6dc774-f44c-11e6-8645-f0428c2b4577.gif)

*[QP encoding](eml-quote-printable-decode)*
![eml quote-printable decode](https://cloud.githubusercontent.com/assets/164819/23193032/a48cb3b6-f85b-11e6-8e86-1da3ddff09bf.gif)

*Custom settings*
![eml settings](https://cloud.githubusercontent.com/assets/164819/23042236/b241d3e6-f44c-11e6-9ec6-be14742cd6de.gif)
