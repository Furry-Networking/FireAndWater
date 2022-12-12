import * as readline from 'readline';

let rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question('Add version? [y/n] ', (answer) => {
  switch(answer.toLowerCase()) {
    case 'y':
      console.log('Configuring requirements.txt before we proceed....');
      const fs = require("fs");
      let text = "lxml";
      fs.writeFileSync("requirements.txt", text, function(err1){
      if(err1){
        return console.log("[ERROR] Could not setup requirements.txt.");
      }
      rl.question('What is the version you want? ', (answer) => {
        const version = answer.toLowerCase()
        var builder = require('xmlbuilder');
        var xml = builder.create('root')
          .ele('xmlbuilder')
            .ele('version', {'type': 'integer_data'}, version)
          .end({ pretty: true});
        fs.writeFileSync("version.xml", xml, function(err2){
        if(err2){
          return console.log("[ERROR] Could not setup version.xml.");
        }
      })
  };
});
    break;
    case 'n':
      console.log('[INFO] Sorry to bother you then! :(');
      break;
    default:
      console.log('[ERROR] Invalid answer!');
  }
  rl.close();
});