module.exports = function(config) {

  config.addPassthroughCopy('qui');
  config.addPassthroughCopy('xml');

  config.setWatchJavaScriptDependencies(false);

  return {
    dir: { input: '.', output: 'dist' },
    passthroughFileCopy: true,
    templateFormats: [ 'njk', 'md', 'css', 'js', 'html' ],
    htmlTemplateEngine: 'njk',
    markdownTemplateEngine: 'njk'
  }
}