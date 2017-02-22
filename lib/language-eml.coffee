quotedPrintable = require('quoted-printable')
utf8 = require('utf8')

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'language-eml:base64-toggle', => @convert @base64Toggle
    atom.commands.add 'atom-workspace', 'language-eml:base64-decode', => @convert @base64Decode
    atom.commands.add 'atom-workspace', 'language-eml:base64-encode', => @convert @base64Encode

    atom.commands.add 'atom-workspace', 'language-eml:quoted-printable-decode', => @convert @quotedPrintableDecode
    atom.commands.add 'atom-workspace', 'language-eml:quoted-printable-encode', => @convert @quotedPrintableEncode

  convert: (converter) ->
    if editor = atom.workspace.getActiveTextEditor()
      selected_text = editor.getSelectedText()

      if selected_text.length == 0
        log("No selected text, taking full editor line.")
        editor.moveToFirstCharacterOfLine()
        editor.selectToEndOfLine()
        selected_text = editor.getSelectedText()

      log("Selected text:\n#{selected_text}")
      new_text = converter(selected_text)

      log("Finished.")
      editor.insertText(new_text, {'select': true})

  quotedPrintableDecode: (text) ->
    utf8.decode(quotedPrintable.decode(text))

  quotedPrintableEncode: (text) ->
    quotedPrintable.encode(utf8.encode(text))

  base64Decode: (text) ->
    new Buffer(text, 'base64').toString('utf8')

  base64Encode: (text) ->
    new Buffer(text).toString('base64')

  base64Toggle: (text) ->
    if isBase64Encoded(text)
      new Buffer(text, 'base64').toString('utf8')
    else
      new Buffer(text).toString('base64')

# Helper functions

isBase64Encoded = (text) ->
  # FIXME: the current regex doesn't allow multiline base64 strings
  if /^(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?$/.test(text)
    true
  else
    false

log = (message) ->
  if atom.inDevMode()
    console.log("EML: #{message}")
