import { When, Then } from 'cucumber';
import * as chai from 'chai';
import * as chaiAsPromised from 'chai-as-promised';
import { browser, ExpectedConditions } from 'protractor';

import rateDetails from '../page-objects/rate-details.po';
import fdxMagr from '../page-objects/fdx-magr.po';
import fdxMagrRates from '../page-objects/rate-details.po';
import elementHelper from '../page-objects/element-helper.po';

chai.use(chaiAsPromised);

When('FedEx One rates are shown', { timeout: 60 * 1000 }, async () => {
  const fedexOneTitle = 'Here are the FedEx One Rate® rates and delivery dates for shipments sent';
  // FedEx One button is active
  await elementHelper.waitForElement(rateDetails.rateSection.rateType.retailRates);
  await chai.expect(rateDetails.rateSection.rateType.activeTabButton.getAttribute('value')).to.eventually.equal('fedexOneRates');
  // Wait for message on rates
  await browser.wait(ExpectedConditions.textToBePresentInElement(rateDetails.rateSection.title, fedexOneTitle), 30 * 1000);
  // Wait for actual rates to load
  await elementHelper.waitForElementRemoval(fdxMagr.loader.waitForPageLoader);
  await chai.expect(fdxMagrRates.rateSection.ratelist.isDisplayed()).to.eventually.be.true;
  await elementHelper.scrollElementIntoView(fdxMagrRates.rateSection.ratelist);

});

When('FedEx Retail rates are shown', { timeout: 60 * 1000 }, async () => {
  const fedexRetailTitle = 'Here are the FedEx® Retail Rates and delivery dates for shipments sent';
  // FedEx Retail button is active
  await elementHelper.waitForElement(rateDetails.rateSection.rateType.retailRates);
  await chai.expect(rateDetails.rateSection.rateType.activeTabButton.getAttribute('value')).to.eventually.equal('fedexStandardRates');
  // Wait for message on rates
  await browser.wait(ExpectedConditions.textToBePresentInElement(rateDetails.rateSection.title, fedexRetailTitle), 30 * 1000);
  // Wait for actual rates to load
  await elementHelper.waitForElementRemoval(fdxMagr.loader.waitForPageLoader);
  await chai.expect(fdxMagrRates.rateSection.ratelist.isDisplayed()).to.eventually.be.true;
  await elementHelper.scrollElementIntoView(fdxMagrRates.rateSection.ratelist);
});

Then('I should see retail rate and one rate links for anonymous user', { timeout: 60 * 1000 }, async () => {
  await elementHelper.waitForElement(rateDetails.rateSection.rateType.retailRates);
  chai.expect(await rateDetails.rateSection.rateType.retailRates.isDisplayed()).to.be.equal(true);
  await elementHelper.waitForElement(rateDetails.rateSection.rateType.fedexOne);
  chai.expect(await rateDetails.rateSection.rateType.fedexOne.isDisplayed()).to.be.equal(true);
});

Then('I get a tip to choose FedEx packaging', { timeout: 60 * 1000 }, async () => {
  const fedexOneHint = 'FedEx One Rate® is only available using FedEx Express® packaging.';
  await browser.wait(ExpectedConditions.textToBePresentInElement(rateDetails.rateSection.title, fedexOneHint), 10 * 1000);
});

Then('I get a tip the weight limit is exceeded', { timeout: 60 * 1000 }, async () => {
  const fedexOneHint = 'This package exceeds the weight limit';
  await browser.wait(ExpectedConditions.textToBePresentInElement(rateDetails.rateSection.title, fedexOneHint), 10 * 1000);
});

When('I request FedEx Retail rates', { timeout: 60 * 1000 }, async () => {
  await elementHelper.waitForElement(rateDetails.rateSection.rateType.retailRates);
  await rateDetails.rateSection.rateType.retailRates.click();
});

When('I request FedEx One rates', { timeout: 60 * 1000 }, async () => {
  await elementHelper.waitForElement(rateDetails.rateSection.rateType.fedexOne);
  await rateDetails.rateSection.rateType.fedexOne.click();
});

When(/^Enter the mandatory (package|envelope) weight$/, { timeout: 60 * 1000 }, async (packageType) => {
  const weight = packageType === 'package' ? 10 : 1;
  await elementHelper.waitForElement(rateDetails.rateSection.package.weight);
  await rateDetails.rateSection.package.weight.sendKeys(weight);
  await rateDetails.rateSection.retailRates.showRates.click();
});

Then('FedEx One rates are not available', async () => {
  await chai.expect(rateDetails.rateSection.rateType.fedexOne.isPresent()).to.eventually.be.false;
  await chai.expect(rateDetails.rateSection.rateType.retailRates.isPresent()).to.eventually.be.false;
});
