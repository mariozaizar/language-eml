'use babel';

// TODO: Migrate to Coffee

import path from 'path'
import fs from 'fs'
import os from 'os'

import { $, ScrollView } from 'atom-space-pen-views'

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
    return EMLView.div({ 'class': 'atom-html-preview native-key-bindings', 'tabindex': -1 })
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

    // Selected text
    preview_content = TextEditor.getSelectedText()

    if (preview_content.length == 0) {
      console.log("No selected text, will search HTMl from the entire file.")
      all_content = TextEditor.getText()
      only_html = all_content.match(/<html(.|\s)*<\/html>/)

      if (only_html) {
        preview_content = only_html[0]
      } else {
        preview_content = '<strong>No HTML found in this Email.</strong> Try selecting the HTML body first.'
      }
    }

    fs.writeFile(file, preview_content, (error) => {
      if (error) {
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
        console.log(error)
        return null
      }
    })
  }

  getTitle() { return "Email Preview" }
  getURI() { return `eml-preview://file` }
}

export default EMLView
