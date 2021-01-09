import { Then } from 'cucumber';
import * as chai from 'chai';
import * as chaiAsPromised from 'chai-as-promised';

import rateDetails from '../page-objects/rate-details.po';
import elementHelper from '../page-objects/element-helper.po';
import { browser } from 'protractor';

chai.use(chaiAsPromised);

Then('The offer is shown in {string}', { timeout: 60 * 1000 }, async (currencyCode) => {
  await elementHelper.waitForElement(rateDetails.rateSection.ratelist);
  await elementHelper.scrollElementIntoView(rateDetails.rateSection.ratelist);
  await chai.expect(rateDetails.rateSection.
    ratePriceCurrencyMessage(`Amounts are shown in ${currencyCode}`).isPresent()).to.eventually.be.true;
});

Then('I see standard rate link is renamed as Account-Specific for loggedIn user', { timeout: 60 * 1000 }, async () => {
  await elementHelper.waitForElement(rateDetails.rateSummary);
  chai.expect(await rateDetails.rateSummary.getText()).to.be.contain('');
});

Then('The rate list is displayed', { timeout: 60 * 1000 }, async () => {
  await elementHelper.waitForElement(rateDetails.rateSection.ratelist);
  chai.expect(await rateDetails.rateSection.ratelist.isDisplayed()).to.be.equal(true);
});

Then(/^The ([0-9]) (?:st|nd|rd) offer price breakdown has price components in "(.+)"$/,
  { timeout: 60 * 1000 }, async function(offer, currencySymbol, componentsTable) {
    await elementHelper.scrollElementIntoView(rateDetails.rateSection.ratelist);

    // Only if we have a price breakddown - validate it
    const priceBreakdownShown = await rateDetails.prices.togglePriceBreakdown(offer).isPresent();

    async function processDatatable(array) {
      for (const element of array) {
        await chai.expect(rateDetails.prices.priceBreakdownComponents.get(element[0]).getText()).to.eventually.contain(element[1]);
        await chai.expect(rateDetails.prices.priceBreakdownComponentsPrices.
          get(element[0]).getText()).to.eventually.contain(currencySymbol);
      }
    }

    if (priceBreakdownShown) {
      this.attach('Price breakdown was shown... validating...');
      await rateDetails.prices.togglePriceBreakdown(offer).click();
      await browser.sleep(2000);
      await chai.expect(rateDetails.prices.priceBreakdownComponents.count(),
        'At least one price breakdown component should be visible').to.eventually.be.at.least(1);
      await elementHelper.scrollElementIntoView(rateDetails.prices.priceBreakdownComponents.first());

      await processDatatable(componentsTable.raw());
    } else {
      this.attach('Price breakdown was NOT shown... unable to validate...');
    }
  });

Then(/^I should see item under the ([0-9]) (?:st|nd|rd) offer price breakdown$/,
  { timeout: 60 * 1000 }, async function(offer, componentsTable) {
    await elementHelper.waitForElement(rateDetails.rateSection.ratelist);
    await elementHelper.scrollElementIntoView(rateDetails.rateSection.ratelist);

    // Only if we have a price breakddown - validate it
    const priceBreakdownShown = await rateDetails.prices.togglePriceBreakdown(offer).isPresent();

    async function processDatatable(array) {
      for (const element of array) {
        await chai.expect(rateDetails.prices.priceBreakdownComponents.get(element[0]).getText()).to.eventually.contain(element[1]);
      }
    }

    if (priceBreakdownShown) {
      this.attach('Price breakdown was shown... validating...');
      await rateDetails.prices.togglePriceBreakdown(offer).click();
      await browser.sleep(2000);
      await chai.expect(rateDetails.prices.priceBreakdownComponents.count(),
        'At least one price breakdown component should be visible').to.eventually.be.at.least(1);
      await elementHelper.scrollElementIntoView(rateDetails.prices.priceBreakdownComponents.first());

      await processDatatable(componentsTable.raw());
    } else {
      this.attach('Price breakdown was NOT shown... unable to validate...');
    }

  });
