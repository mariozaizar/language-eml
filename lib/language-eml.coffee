module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'language-eml:base64-toggle', => @convert @base64Toggle
    atom.commands.add 'atom-workspace', 'language-eml:base64-decode', => @convert @base64Decode
    atom.commands.add 'atom-workspace', 'language-eml:base64-encode', => @convert @base64Encode

  convert: (converter) ->
    if editor = atom.workspace.getActiveTextEditor()
      selected_text = editor.getSelectedText()

      if selected_text.length == 0
        console.log("EML: No selected text, taking full editor line.")
        editor.moveToFirstCharacterOfLine()
        editor.selectToEndOfLine()
        selected_text = editor.getSelectedText()

      console.log("EML: Selected text: '#{selected_text}'")
      selected_lines = selected_text.split(/\n+/)

      if selected_lines.length > 1
        console.log("EML: Multiline detected! Converting a total of #{selected_lines.length} lines.")
        new_text = ""
        for text in selected_lines
          new_text += "#{converter(text)}\n"
      else
        console.log("EML: Converting a single line.")
        new_text = converter(selected_text)

      console.log("EML: done.")
      editor.insertText(new_text, {'select': true})

  base64Decode: (text) ->
    if isBase64Encoded(text)
      new Buffer(text, 'base64').toString('utf8')
    else
      console.log("EML: Abort decoding! this is NOT a Base64 string.")
      text

  base64Encode: (text) ->
    if isBase64Encoded(text)
      console.log("EML: Abort encoding! this is already a Base64 string.")
      text
    else
      new Buffer(text).toString('base64')

  base64Toggle: (text) ->
    if isBase64Encoded(text)
      console.log("EML: Decoding to Base64")
      new Buffer(text, 'base64').toString('utf8')
    else
      console.log("EML: Encoding to Base64")
      new Buffer(text).toString('base64')

# Helper functions

isBase64Encoded = (text) ->
  # if /^[A-Za-z0-9+/=]+$/.test(text)
  if /^(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?$/.test(text)
    true
  else
    false
