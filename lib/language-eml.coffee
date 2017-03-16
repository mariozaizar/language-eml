# Atom & Internal
{CompositeDisposable} = require 'atom'
EMLView = require './language-eml-view'

# External
url = require 'url'
utf8 = require 'utf8'
quotedPrintable = require 'quoted-printable'

AtomPanelView = null

module.exports =
  desactivate: ->
    log "Deactivated"
    @subscriptions.dispose()

  activate: ->
    atom.commands.add 'atom-workspace', 'language-eml:base64-decode', => @convert @base64Decode
    atom.commands.add 'atom-workspace', 'language-eml:base64-encode', => @convert @base64Encode
    log "Base64 activated"

    atom.commands.add 'atom-workspace', 'language-eml:quoted-printable-decode', => @convert @quotedPrintableDecode
    atom.commands.add 'atom-workspace', 'language-eml:quoted-printable-encode', => @convert @quotedPrintableEncode
    log "Quoted Printable activated"

    atom.workspace.addOpener(@emlOpener)
    @subscriptions = new CompositeDisposable()
    @subscriptions.add atom.commands.add 'atom-workspace', 'language-eml:email-preview', => @openPane()
    log "Email Preview activated"

  ###############################################################
  emlOpener: (uri) ->
    try
      {protocol, pathName} = url.parse(uri)
      if protocol != 'eml-preview:'
        log "This can be used only for EML preview content!"
        return

      AtomPanelView = new EMLView(decodeURI(pathName))
      return AtomPanelView

    catch error
      log "There was an error opening the email #{error}"
      return

  openPane: (currentEditor) ->
    if editor = currentEditor || atom.workspace.getActiveTextEditor()
      grammar = editor.getGrammar()
      uri = 'eml-preview://file'
      pane = atom.workspace.paneForURI(uri)

      if grammar.scopeName != 'text.eml.basic'
        log "This can be used only with EML files!"
        return

      pane.destroyItem(pane.itemForURI(uri)) if pane
      atom.workspace.open(uri, { split: 'right', searchAllPanes: true }).then(() => AtomPanelView.render(editor))
  ###############################################################
  convert: (converter) ->
    if editor = atom.workspace.getActiveTextEditor()
      selected_text = editor.getSelectedText()

      if selected_text.length == 0
        log "No selected text, taking full editor line"
        editor.moveToFirstCharacterOfLine()
        editor.selectToEndOfLine()
        selected_text = editor.getSelectedText()

      log "Selected text:\n#{selected_text}"
      new_text = converter(selected_text)

      log "Finished"
      editor.insertText(new_text, {'select': true})

  quotedPrintableDecode: (text) ->
    utf8.decode(quotedPrintable.decode(text))

  quotedPrintableEncode: (text) ->
    quotedPrintable.encode(utf8.encode(text))

  base64Decode: (text) ->
    new Buffer(text, 'base64').toString('utf8')

  base64Encode: (text) ->
    new Buffer(text).toString('base64')

#################################################################
# Helper functions

isBase64Encoded = (text) ->
  # FIXME: the current regex doesn't allow multiline base64 strings
  if /^(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?$/.test(text)
    true
  else
    false

log = (message) ->
  if atom.inDevMode()
    console.log "EML: #{message}"
