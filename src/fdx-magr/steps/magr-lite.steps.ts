
import { Given, When, Then } from 'cucumber';
import { browser, ExpectedConditions } from 'protractor';
import * as chai from 'chai';
import * as chaiAsPromised from 'chai-as-promised';
import { currentEnvLevel } from '../../data/env-config';
import fdxMagr from '../page-objects/fdx-magr.po';
import elementHelper from '../page-objects/element-helper.po';
import fdxPkgDetails from '../page-objects/package-details.po';
import fdxMagrRates from '../page-objects/rate-details.po';

chai.use(chaiAsPromised);

Given('I browse to MAGR lite application', { timeout: 60 * 1000 }, async () => {
  await browser.get(browser.baseUrl);
  // await elementHelper.waitForElementRemoval(fdxMagr.loader.waitForPageLoader);
  await browser.sleep(1000); // Allow translations to load
});

When('carriage value field in not available for magr-lite', { timeout: 60 * 1000 }, async () => {
  await chai.expect(fdxPkgDetails.carriageValue.isPresent(),
    'For magr-lite carriage field is not shown').to.eventually.be.false;
});

Then('I do not see signature options', { timeout: 60 * 1000 }, async () => {
  await chai.expect(fdxMagrRates.signatureOptions.label.isPresent()).to.eventually.be.false;
  await chai.expect(fdxMagrRates.signatureOptions.tooltip.isPresent()).to.eventually.be.false;
});

Given(/^I check LTL link (is|is not) shown$/, { timeout: 60 * 1000 }, async (expect) => {
  await elementHelper.waitForElement(fdxMagr.sendFrom);
  if (expect === 'is not') {
    await chai.expect(fdxMagr.appBarComponent.ltlLink.isPresent()).to.eventually.be.false;
    return;
  } else {
    await chai.expect(fdxMagr.appBarComponent.ltlLink.isDisplayed()).to.eventually.be.true;
    return;
  }
});

Then('I check FROM field is populated with default user address in {string}', { timeout: 60 * 1000 }, async (validate) => {
  await browser.wait(ExpectedConditions.textToBePresentInElementValue(fdxMagr.sendFrom, validate), 10 * 1000);
  await chai.expect(fdxMagr.sendFrom.getAttribute('value')).to.eventually.contain(validate);
});

 // This step takes you to actual AEM page with MAGR which is slow. So currently we are not using it
Given('I browse on one of the testlevels of MAGR', { timeout: 60 * 1000 }, async () => {
  await browser.get(currentEnvLevel);
  await elementHelper.waitForElement(fdxMagr.loader.waitForPageLoader);
  await elementHelper.waitForElementRemoval(fdxMagr.loader.waitForPageLoader);
});

