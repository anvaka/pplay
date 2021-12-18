const path = require('path');
const MonacoWebpackPlugin = require('monaco-editor-webpack-plugin');

module.exports = {
  publicPath: '',
  configureWebpack: {
    plugins: [
      new MonacoWebpackPlugin({
        languages: [],
        //features: ['!accessibilityHelp', '!bracketMatching', '!caretOperations', '!clipboard']
      })
    ]
  },
  chainWebpack: config => {
    // GLSL Loader
    config.module
      .rule('glsl')
      .test(/\.(glsl|frag|vert)$/)
      .use('raw-loader')
        .loader('raw-loader')
        .end();

    config.module
      .rule('monaco')
      .test({
        test: /\.js$/,
        include: path.join(__dirname, 'node_modules/monaco-editor/esm/vs'),
      })
      .use('babel-loader')
      .loader('babel-loader')
      .options({
        presets: ['@babel/preset-env'],
        plugins: ['@babel/plugin-proposal-optional-chaining']
      }).end();
  }
}