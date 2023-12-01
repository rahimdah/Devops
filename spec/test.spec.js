// tests/test.spec.js
const { JSDOM } = require('jsdom');
const fs = require('fs');
const path = require('path');

describe("Mon application web", function () {
    it("devrait avoir une page d'accueil avec un titre", function () {
        const dom = new JSDOM('<!DOCTYPE html><html><head></head><body></body></html>');
        global.document = dom.window.document;

        // Obtenez le chemin absolu vers le fichier HTML à partir de la racine du projet
        const htmlPath = path.resolve(__dirname, '../index.html');

        // Chargez le contenu du fichier HTML
        const htmlContent = fs.readFileSync(htmlPath, 'utf-8');
        dom.window.document.body.innerHTML = htmlContent;

        // Vérifiez le titre réel de la page
        const expectedTitle = 'Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co';
        expect(dom.window.document.title).toBe(expectedTitle);
    });

    afterEach(function () {
        delete global.document;
    });
});
