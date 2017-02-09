module.exports =
  activate: ->
    atom.commands.add 'atom-workspace',
      'language-eml:base64-decode', =>
        @unwrap

    # TODO:
    # atom.commands.add 'atom-workspace',
    #   'language-eml:base64-decode', =>
    #     @decodeBase64Multiparts

    # TODO:
    # atom.commands.add '.tree-view .file .name',
    #   'language-eml:base64-decode': =>
    #     @decodeBase64Multiparts

    # TODO:
    # atom.commands.add '.tree-view .directory .name',
    #   'language-eml:base64-decode': =>
    #     @decodeBase64Multiparts

  unwrap: ()->
    editor = atom.workspace.getActiveTextEditor()
    selections = editor.getSelections()

    for selection in selections
      str = selection.getText().replace(/\=\n/g, '')
      selection.insertText(str, {'select': true})
