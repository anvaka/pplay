import * as monaco from 'monaco-editor/esm/vs/editor/editor.api.js';
import {glslMonacoLanguage} from './language.js'
import {debounce} from '../util/utils.js';

var eventify = require('ngraph.events');
const checkGLSL = require('../editor/parserServer.js');
const NO_SUGGESTIONS = undefined;

const CompletionKindToSuggestionKind = {
  variable: monaco.languages.CompletionItemKind.Variable,
  function: monaco.languages.CompletionItemKind.Function,
  struct: monaco.languages.CompletionItemKind.Struct,
  keyword: monaco.languages.CompletionItemKind.Keyword
};

monaco.languages.register({ id: 'glsl' });
monaco.languages.setLanguageConfiguration('glsl', glslMonacoLanguage.configuration);
monaco.languages.setMonarchTokensProvider('glsl', glslMonacoLanguage.tokenProvider);

monaco.languages.registerCompletionItemProvider('glsl', {
  triggerCharacters: ['.'],
  provideCompletionItems(model, position) {
    const contents = model.getValue();
    if (contents.length === 0) return NO_SUGGESTIONS;
    let line = model.getLineContent(position.lineNumber);
    let previousCharacter = position.column - 2; // they are 1-based
    if (line[previousCharacter] === '.' && isDigit(line[previousCharacter - 1])) {
      return NO_SUGGESTIONS;
    }
    let res = checkGLSL(contents);

    let q = res.completionQuery({
      source: 'input',
      line: position.lineNumber - 1,
      column: position.column - 1,
    });

    return {
      suggestions: q.completions.map(c => {
        return {
          label: c.name,
          kind: CompletionKindToSuggestionKind[c.kind],
          insertText: c.name,
          detail: c.detail,
          documentation: {
            value: c.documentation
          }
        }
      })
    };
  }
})

monaco.languages.registerHoverProvider('glsl', {
  provideHover(model, position) {
    const contents = model.getValue();
    let compiled = checkGLSL(contents);
    let response = compiled.tooltipQuery({
      ignoreDiagnostics: true,
      source: 'input',
      line: position.lineNumber - 1,
      column: position.column - 1,
    });
    if (response.tooltip !== null && response.range !== null) {
      return {
        contents: [
          {value: '```glsl\n' + response.tooltip + '\n```'},
          {value: response.documentation}
        ],
        range: convertToRange(response.range)
      }
    }
    return {contents: []};
  }
});

function convertToRange(range) {
  return {
    startLineNumber: range.start.line + 1,
    startColumn: range.start.column + 1,
    endLineNumber: range.end.line + 1,
    endColumn: range.end.column + 1,
  }
}

monaco.languages.registerDefinitionProvider('glsl', {
  provideDefinition(model, position) {
    const contents = model.getValue();

    let compiled = checkGLSL(contents);
    let response = compiled.definitionQuery({
      source: 'input',
      line: position.lineNumber - 1,
      column: position.column - 1,
    });
    if (response.definition === null || response.definition.source !== 'input') {
      return []
    }
    return {
      uri: response.definition.source,
      range: convertToRange(response.definition),
    };
  }
})

monaco.editor.defineTheme('pplay-blue', {
  base: 'vs-dark',
  inherit: true,
  rules: [],
  colors: {'editor.background': '#061838'}
});

export function createEditor(container, code) {
  let hasErrors = false;
  let changedContent = false;
  let validationPerformed = false;

  let editor = monaco.editor.create(container, {
    value: code,
    automaticLayout: true,
    fixedOverflowWidgets: true,
    language: 'glsl',
    theme: 'pplay-blue',
    fontSize: 14,
    minimap: {
      enabled: false,
    },
  });
  // Don't hijack cmd + l (got to browser's input field)
  editor._standaloneKeybindingService.addDynamicKeybinding('-expandLineSelection', null, Function.prototype);

  // Hack to make suggestion details visible by default:
  let {widget} = editor.getContribution('editor.contrib.suggestController');
  if (widget) {
    const suggestWidget = widget.value;
    if (suggestWidget && suggestWidget._setDetailsVisible) {
      suggestWidget._setDetailsVisible(true);
    }
  }

  editor.getModel().onDidChangeContent(() => {
    changedContent = true;
    validationPerformed = false;
    debounce(() => validate(editor.getModel()), 500);
  })
  
  let api = {
    dispose,
    editor,
    getValue,
    setValue
  }

  eventify(api);

  return api;

  function getValue() {
    return editor.getModel().getValue();
  }

  function setValue(code) {
    editor.getModel().setValue(code);
  }

  function validate(model) {
    const contents = model.getValue();
    let res = checkGLSL(contents);
    let markers = res.diagnostics.filter(d => d.range.source === 'input').map(d => {
      return {
        severity: monaco.MarkerSeverity.Error,
        startLineNumber: d.range.start.line + 1,
        startColumn: d.range.start.column + 1,
        endLineNumber: d.range.end.line + 1,
        endColumn: d.range.end.column + 1,
        message: d.text
      }
    })

    validationPerformed = true;
    hasErrors = markers.length > 0;
    notifyContentChanged();
    monaco.editor.setModelMarkers(model, 'glsl', markers);
  }

  function notifyContentChanged() {
    if (!hasErrors && validationPerformed && changedContent){
      api.fire('content-changed', editor, hasErrors);
      changedContent = false;
    }
  }

  function dispose() {
    editor.dispose();
  }
}

function isDigit(c) {
  return c >= '0' && c <= '9';
}