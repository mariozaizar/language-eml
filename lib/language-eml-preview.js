'use babel';

import url from 'url'
import { CompositeDisposable } from 'atom'
import EMLView from './language-eml-view'

let AtomPanelView = null

export default {
//   config: {
//     previewAfterSave: {
//       type: 'boolean',
//       description: 'Launch the Email preview on each file-save.',
//       default: false,
//     },
//   },

  desactivate() {
    this.subscriptions.dispose()
  },

  activate() {
    this.subscriptions = new CompositeDisposable()
    this.subscriptions.add(atom.workspace.observeTextEditors((editor) => {
      this.subscriptions.add(editor.onDidSave(() => {
        // If the customer has this setting activated
        // if (atom.config.get('language-eml.previewAfterSave')) {
        //   // Update the preview panel
        //   this.openPane(editor)
        // }
      }))
    }))

    // Enable opener
    atom.workspace.addOpener(this.emlPreviewOpener)

    // Add keybidings
    this.keybindings()
  },

  keybindings() {
    this.subscriptions.add(
      // language-eml:html-preview => Opens the preview panel
      atom.commands.add('atom-workspace', { 'language-eml:html-preview': () => this.openPane() })
    )
  },

  openPane(editor) {
    const uri = 'eml-preview://file'
    const currentEditor = editor || atom.workspace.getActiveTextEditor()
    const previewPanel = atom.workspace.paneForURI(uri)
    const fileGrammar = currentEditor.getGrammar()

    // WARNING: This will trigger on every file save!
    if (fileGrammar.scopeName !== 'text.eml.basic') { return; }

    if (previewPanel) { previewPanel.destroyItem(previewPanel.itemForURI(uri)) }

    atom.workspace.open(uri, { split: 'right', searchAllPanes: true }).then(() => AtomPanelView.render(currentEditor))
  },

  emlPreviewOpener(uri) {
    try {
      const { protocol, pathname } = url.parse(uri)
      if (protocol !== 'eml-preview:') { return; }

      const filePath = decodeURI(pathname)
      AtomPanelView = new EMLView(filePath)
      return AtomPanelView

    } catch (error) {
      console.log(error)
      return;
    }
  },
}
