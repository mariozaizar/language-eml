'use babel';

import url from 'url'
import { CompositeDisposable } from 'atom'
import EMLView from './language-eml-view'

let AtomPanelView = null

export default {
  desactivate() {
    this.subscriptions.dispose()
  },

  activate() {
    this.subscriptions = new CompositeDisposable()
    atom.workspace.addOpener(this.emlOpener)
    this.subscriptions.add(
      atom.commands.add('atom-workspace', { 'language-eml:html-preview': () => this.openPane() })
    )
  },

  emlOpener(uri) {
    try {
      const { protocol, pathName } = url.parse(uri)
      if (protocol !== 'eml-preview:') { return; }

      AtomPanelView = new EMLView(filePath = decodeURI(pathName))
      return AtomPanelView

    } catch (error) {
      console.log(error)
      return;
    }
  },

  openPane(currentEditor) {
    const editor = currentEditor || atom.workspace.getActiveTextEditor()
    const grammar = editor.getGrammar()
    const uri = 'eml-preview://file'
    const pane = atom.workspace.paneForURI(uri)

    if (grammar.scopeName !== 'text.eml.basic') { return; }

    if (pane) { pane.destroyItem(pane.itemForURI(uri)) }
    atom.workspace.open(uri, { split: 'right', searchAllPanes: true }).then(() => AtomPanelView.render(editor))
  },
}
