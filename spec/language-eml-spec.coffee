path = require 'path'
grammarTest = require 'atom-grammar-test'

# TODO:
describe 'HTML grammar', ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('language-eml')

    runs ->
      grammar = atom.grammars.grammarForScopeName('constant.language.eml')

  it 'parses the grammar', ->
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe 'constant.language.eml'

  grammarTest path.join(__dirname, 'fixtures/example.eml')
