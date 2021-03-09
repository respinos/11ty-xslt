const fs = require('fs');
const { exec } = require('child_process');



fs.mkdir('dist', { recursive: true }, (err) => {
  if(err) {
    return console.log('could not create dist');
  }
  exec("xsltproc ./xsl/books.xsl ./xml/books1.xml", ( error, stdout, stderr ) => {
    fs.writeFileSync("./dist/books1.xml", stdout);
    console.log('-30-');
  })
})