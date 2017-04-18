'use babel';

// TODO: Migrate to Coffee

import { Emitter, Disposable, CompositeDisposable, File} from 'atom'
import { $, ScrollView } from 'atom-space-pen-views'

import path from 'path'
import fs from 'fs'
import os from 'os'

class EMLView extends ScrollView {
  static serialiaze() {
    return {
      deserializer: 'AtomHtmlPreviewView',
      filePath: this.filePath,
    }
  }

  static deserialize ({ filePath }) {
    return new EMLView(filePath)
  }

  static content () {
    return EMLView.div({ 'class': 'language-eml-preview native-key-bindings', 'tabindex': -1 })
  }

  constructor(filePath) {
    super()
    this.filePath = filePath
    atom.deserializers.add(this)
    this.createWebView()
  }

  createWebView() {
    this.webview = document.createElement('webview')

    // Not including Sandbox's `allow-scripts` to avoid malicious code from EML files.
    //  allow-same-origin: Allows the content to be treated as being from its normal origin.
    this.webview.setAttribute('sandbox', 'allow-same-origin')
    this.webview.setAttribute('style', 'height: 100%;')

    this.append($(this.webview))
  }

  renderHTML(TextEditor, done) {
    const file = path.resolve(path.join(os.tmpdir(), `${TextEditor.getTitle()}.html`))

    selectedText = TextEditor.getSelectedText()
    if (selectedText.length == 0) {
      console.log("No selected text, will search HTMl from the entire file.")
      html = TextEditor.getText().match(/<html(.|\s)*<\/html>/)

      if (html) {
        selectedText = html[0]
      } else {
        atom.notifications.addWarning('No HTML found in this Email', {detail: 'Try selecting the HTML body first.'})
        selectedText = '<b>No HTML found in this Email.</b><br><i>Try selecting the HTML body first.</i>'
      }
    }

    fs.writeFile(file, selectedText, (error) => {
      if (error) {
        atom.notifications.addWarning(error.reason)
        console.log(error)
        throw error
      }

      console.log("Saving preview file as: " + file)
      done(file)
    })
  }

  render(TextEditor) {
    this.renderHTML(TextEditor, (file) => {
      try {
        this.webview.src = file
      } catch (error) {
        atom.notifications.addWarning(error.reason)
        console.log(error)
        return null
      }
    })
  }

  getTitle() { return "Email Preview" }
  getURI() { return `eml-preview://file` }
}

export default EMLView
