# Atom & Internal
{CompositeDisposable} = require 'atom'
EMLView = require './language-eml-view'

# External
url = require 'url'
utf8 = require 'utf8'
windows1251 = require 'windows-1251'
quotedPrintable = require 'quoted-printable'

AtomPanelView = null

module.exports =
  desactivate: ->
    log "Deactivated"
    @subscriptions.dispose()

  activate: ->
    atom.commands.add 'atom-workspace',
      'language-eml:base64-decode': =>
        @convert @base64Decode

      'language-eml:base64-encode': =>
        @convert @base64Encode

      'language-eml:quoted-printable-decode': =>
        @convert @quotedPrintableDecode

      'language-eml:quoted-printable-encode': =>
        @convert @quotedPrintableEncode

      # Headers with encoded-words (https://www.ietf.org/rfc/rfc2047.txt)
      'language-eml:encoded-words-decode': =>
        @convert @decodeEncodedWords

      # https://www.npmjs.com/package/node-tnef
      'language-eml:tnef-decode': =>
        @convert @decodeTNEF

      # WIP
      # 'language-eml:saveAsHtml': =>
      #   @saveAsHtml()
      #
      # 'language-eml:copyAsHtml': =>
      #   @copyAsHtml()

    log "Commands activated"

    atom.workspace.addOpener(@emlOpener)
    @subscriptions = new CompositeDisposable()
    @subscriptions.add atom.commands.add 'atom-workspace',
      'language-eml:email-preview': =>
        @openPane()

    log "Email Preview activated"

  ###############################################################
  emlOpener: (uri) ->
    try
      {protocol, pathName} = url.parse(uri)
      if protocol != 'eml-preview:'
        log 'This can be used only for EML preview content!'
        return

      AtomPanelView = new EMLView(decodeURI(pathName))
      return AtomPanelView

    catch error
      atom.notifications.addWarning error.reason
      return

  openPane: (currentEditor) ->
    if editor = currentEditor || atom.workspace.getActiveTextEditor()
      grammar = editor.getGrammar()
      uri = 'eml-preview://file'
      pane = atom.workspace.paneForURI(uri)

      if grammar.scopeName != 'text.eml.basic'
        log 'This can be used only with EML files!'
        return

      pane.destroyItem(pane.itemForURI(uri)) if pane
      atom.workspace.open(uri, { split: 'right', searchAllPanes: true }).then(() => AtomPanelView.render(editor))

  # WIP
  # copyAsHtml: () ->
  #   uri = 'eml-preview://file'
  #   if pane = atom.workspace.paneForURI(uri)
  #     atom.clipboard.write(pane.getText())
  #
  # saveAsHtml: () ->
  #   uri = 'eml-preview://file'
  #   if pane = atom.workspace.paneForURI(uri)
  #     pane.saveAs()

  ###############################################################
  convert: (converter) ->
    if editor = atom.workspace.getActiveTextEditor()
      selectedText = editor.getSelectedText()

      if selectedText.length == 0
        log "No selected text, taking full editor line"
        editor.moveToFirstCharacterOfLine()
        editor.selectToEndOfLine()
        selectedText = editor.getSelectedText()

      log "Selected text:\n#{selectedText}"
      newText = converter(selectedText)

      log "Finished"
      editor.insertText(newText, {'select': true})

  quotedPrintableDecode: (text) ->
    text = quotedPrintable.decode(text)
    try
      text = utf8.decode(text)
    catch error
      log "Can't decode using UTF8, trying with Windows1251. Error was: #{error.reason}"
      text = windows1251.decode(text)

    text

  quotedPrintableEncode: (text) ->
    quotedPrintable.encode(utf8.encode(text))

  base64Decode: (text) ->
    new Buffer(text, 'base64').toString('utf8')

  base64Encode: (text) ->
    new Buffer(text).toString('base64')

  decodeTNEF: (text) ->
    tnefContent = text.match(/=\?utf-8\?B\?(.*)\?=/g)
    log("TNEF: #{tnefContent}")

    if tnefContent
      for element, i in tnefContent
        log("#{i}.- #{element}")
        elementMatch = element.match(/=\?utf-8\?B\?(.*)\?=/)
        decodedElement = new Buffer(elementMatch[1], 'base64').toString('utf8')
        text = text.replace(element, decodedElement)
      text

  decodeEncodedWords: (text) ->
    allEncodedWords = text.match(/=\?utf-8\?B\?(.*)\?=/g)
    log("Encoded-Words: #{allEncodedWords}")

    if allEncodedWords
      for element, i in allEncodedWords
        log("#{i}.- #{element}")
        elementMatch = element.match(/=\?utf-8\?B\?(.*)\?=/)
        decodedElement = new Buffer(elementMatch[1], 'base64').toString('utf8')
        text = text.replace(element, decodedElement)
      text

#################################################################
# Helper functions

isBase64Encoded = (text) ->
  # FIXME: the current regex doesn't allow multiline base64 strings
  if /^(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?$/.test(text)
    true
  else
    false

log = (message) ->
  if atom.inDevMode() || true
    console.log "EML: #{message}"
