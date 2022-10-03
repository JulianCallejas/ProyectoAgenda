const dateFormat = require('./node_modules/dateformat/lib/dateformat.js');
const fs = require('fs');
const now = new Date();
const currentData = dateFormat(now, "dd.mm.yyyy HH.MM");
const newman = require('newman');
// add the path to your exported postman collection
const collection = require('./AgendAPP.postman_collection.json');
const reportName = 'AgendaAPPTests.html';


newman.run({
    collection,
    reporters: ['cli', 'htmlextra'],
    iterationCount: 2,
    reporter: {
        htmlextra: {
            // commented lines are the all possibilities available to be set for the report document
            export: `./${currentData}/${reportName}`,
            /*
            this is the original location of the template but can be copied modified, moved and linked to it
            if you don't specify template path will use the default one ./node_modules/newman-reporter-htmlextra/lib/dashboard-template.hbs
            */
            template: './node_modules/newman-reporter-htmlextra/lib/dashboard-template.hbs',
            // logs: true,
            // showOnlyFails: true,
            // noSyntaxHighlighting: true,
            // testPaging: true,
            browserTitle: "AgendApp Newman report",
            title: 'Report - AgendApp ' + currentData,
            titleSize: 5,
            // omitHeaders: true,
            // skipHeaders: "Authorization",
            // omitRequestBodies: true,
            // omitResponseBodies: true,
            // hideRequestBody: ["Login"],
            // hideResponseBody: ["Auth Request"],
            showEnvironmentData: true,
            // skipEnvironmentVars: ["API_KEY"],
            // showGlobalData: true,
            // skipGlobalVars: ["API_TOKEN"],
            // skipSensitiveData: true,
            // showMarkdownLinks: true,
            showFolderDescription: true,
            // timezone: "Australia/Sydney",
            // skipFolders: "folder name with space,folderWithoutSpace",
            // skipRequests: "request name with space,requestNameWithoutSpace",
            // displayProgressBar: true
        }
    }
}).on('request', (error, data) => {
    const requestName = data.item.name;
    const fileName = `${requestName}.pdf`;
    let content = data.response.stream.toString();

    /* You need to modify this in order to get the specific
 data of encoded string from your API response */
   content = {"html":content}
   content = JSON.stringify(content)
   let pdfEncodedString = JSON.parse(content).pdfData;

    if (error) {
        console.log(error);
        return;
    }


    if (pdfEncodedString !== undefined) {

        if (!fs.existsSync(currentData)) fs.mkdirSync(currentData, { recursive: true });

        fs.writeFile(currentData + '/' + fileName, pdfEncodedString, 'base64', function (error) {
            if (error) {
                console.error(error);
            } else {
                const pdf = require('pdf-parse');
                let dataBuffer = fs.readFileSync(currentData + '/' + fileName);
                pdf(dataBuffer).then(function (data) {
                    /*  number of pages    
                    console.log(data.numpages);     
                    //number of rendered pages    
                    console.log(data.numrender);     
                    //PDF info    
                    console.log(data.info);     
                    //PDF metadata    
                    console.log(data.metadata);      
                    //PDF.js version     
                    check https://mozilla.github.io/pdf.js/getting_started/    
                    console.log(data.version);     PDF text    console.log(data.text);
                    */
                    console.log('Content: ', data.text);
                    console.log('Specific word: ', data.text.includes('some_text_you_want_to_find'));  // you can use any js logic here or regex
                    console.log('number of pages:', data.numpages);
                    console.log('number of rendered pages:', data.numrender);
                    console.log(data.info);
                });
            }
        });
    } else {
        console.log('Pdf encoded string not found in the body response')
    }
});