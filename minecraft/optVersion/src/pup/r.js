import puppeteer from 'puppeteer';

(async () => {
const ua = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36';
const url = "https://www.minecraft.net/en-us/download/server/bedrock";

const browser = await puppeteer.launch({headless: 'new'});
//console.log('im good\n');
const page = await browser.newPage();
page.setUserAgent(ua);



const content = await page.goto(url, {
  waitUntil: 'networkidle2',
});
const text = await content.text();
//console.log(text);

await page.screenshot({
  path: 'full.png',
	fullPage: true,
});

//const tick = await page.waitForSelector('');
try {
    await page.click('.MC_CheckboxA_input[data-bi-id="n1a3"]');
    console.log('Checkbox clicked.');
}
catch (error) {
    console.error('Error clicking checkbox by class name:', error);
}

await page.screenshot({
  path: 'full-after.png',
	fullPage: true,
});

try {
	await page.waitForSelector('.MC_Button.MC_Button_Hero_Outline.MC_Glyph_Download_A');
	await page.click('.MC_Button.MC_Button_Hero_Outline.MC_Glyph_Download_A');    
	console.log('Download button clicked.');
}
catch (error) {
  console.error('Error clicking download button:', error);
}

const content_a = await page.content();
const text_a = await content_a;
console.log(text_a);



await browser.close();
})();

