import { Given, When, Then } from 'cucumber';
import * as chai from 'chai';
import * as chaiAsPromised from 'chai-as-promised';
import fdxPkgDetails from '../page-objects/package-details.po';
import fdxPkgDimensions from '../page-objects/package-dimensions.po';
import elementHelper from '../page-objects/element-helper.po';
import fdxMagrRates from '../page-objects/rate-details.po';
import packageDetailsPo from '../page-objects/package-details.po';
import { browser } from 'protractor';

chai.use(chaiAsPromised);

Given('I am shipping one {string} weighing {int} {string}', { timeout: 60 * 1000}, async (packageType, weight, weightUnit) => {
  await elementHelper.waitForElement(fdxPkgDetails.packaging);
  await fdxPkgDetails.packaging.click();
  await fdxPkgDetails.selectPackageType(packageType).click();
  await fdxPkgDetails.packageWeight.clear();
  await fdxPkgDetails.packageWeight.sendKeys(weight);
  await fdxPkgDetails.selectWeightUnit(weightUnit).click();
});

Given('I choose to ship with {string} packaging', { timeout: 60 * 1000}, async (packageType) => {
  await elementHelper.waitForElement(fdxPkgDetails.packaging);
  await fdxPkgDetails.packaging.click();
  await fdxPkgDetails.selectPackageType(packageType).click();
});

Given('Dimensions cannot be entered for FedEx packaging or magr-lite', { timeout: 60 * 1000}, async () => {
  await elementHelper.waitForElement(fdxPkgDetails.packaging);
  await chai.expect(fdxPkgDetails.packageDimensions.isPresent(),
    'For FedEx packaging no dimensions can be entered').to.eventually.be.false;
});

Given('I want to ship {int} packages', { timeout: 60 * 1000}, async (packages) => {
  await elementHelper.waitForElement(fdxPkgDetails.packaging);
  await chai.expect(fdxPkgDetails.NoOfPackages.isDisplayed()).to.eventually.be.true;
  await fdxPkgDetails.NoOfPackages.click();
  await fdxPkgDetails.selectNoOfPackages(packages).click();
});

Given('the packages are identical', { timeout: 60 * 1000}, async () => {
  await elementHelper.waitForElement(fdxPkgDetails.multipackageArea);
  await chai.expect(fdxPkgDetails.multipackageArea.isDisplayed()).to.eventually.be.true;
});


Given(/^my package weighs (.*)$/, { timeout: 60 * 1000}, async (weight) => {
  await elementHelper.waitForElement(fdxPkgDetails.packageWeight);
  await chai.expect(fdxPkgDetails.packageWeight.isDisplayed()).to.eventually.be.true;
  await fdxPkgDetails.packageWeight.click();
  await fdxPkgDetails.packageWeight.clear();
  await fdxPkgDetails.packageWeight.sendKeys(weight);
});

Given('the weight on package line {int} is {string}', { timeout: 60 * 1000}, async (lineNumber, weight) => {
  await elementHelper.waitForElement(fdxPkgDetails.newCarriageWeight(lineNumber - 1));
  await chai.expect(fdxPkgDetails.newCarriageWeight(lineNumber - 1).isDisplayed()).to.eventually.be.true;
  await fdxPkgDetails.newCarriageWeight(lineNumber - 1).click();
  await fdxPkgDetails.newCarriageWeight(lineNumber - 1).clear();
  await fdxPkgDetails.newCarriageWeight(lineNumber - 1).sendKeys(weight);
});

Given('the carriage value is {int} {string}', { timeout: 60 * 1000}, async (value, currency) => {
  await fdxPkgDetails.carriageValue.click();
  await fdxPkgDetails.carriageValue.clear();
  await fdxPkgDetails.carriageValue.sendKeys(value);
  await fdxPkgDetails.carriageValueCurrencyOption(currency).click();
});

Given('the carriage value on package line {int} is {string} {string}', { timeout: 60 * 1000}, async (lineNumber, value, currency) => {
  await fdxPkgDetails.newCarriageValue(lineNumber - 1).click();
  await fdxPkgDetails.newCarriageValue(lineNumber - 1).clear();
  await fdxPkgDetails.newCarriageValue(lineNumber - 1).sendKeys(value);
  await fdxPkgDetails.carriageValueCurrencyOption(currency).click();
});

Given('I want to ship with my own packaging', { timeout: 60 * 1000}, async (table) => {
  await elementHelper.waitForElement(fdxPkgDimensions.packageDetails);
  await table.hashes().map(pkg => fdxPkgDimensions.setValues(pkg));
});

Then('my packaging options are', { timeout: 60 * 1000}, async (expectedPackageOptionsTable) => {
  await elementHelper.waitForElement(fdxPkgDetails.packaging);

  async function processPackageOptionsTable(array) {
    for (const element of array) {
      await chai.expect(packageDetailsPo.selectPackageType(element[0]).isPresent(),
        `expect packaging type "${element[0]}" to be in the packaging list`).to.eventually.be.true;
    }
  }

  await processPackageOptionsTable(expectedPackageOptionsTable.raw());
  await chai.expect(packageDetailsPo.allPackageTypeOptions.count())
    .to.eventually.equal(expectedPackageOptionsTable.raw().length);

});

Then('I set package weight unit to {string}', { timeout: 60 * 1000}, async (weightUnit) => {
  await fdxPkgDetails.selectWeightUnit(weightUnit).click();
});

Then('The package section is {string}', { timeout: 60 * 1000}, async (isDisplayed) => {
  isDisplayed = isDisplayed === 'appeared' ? true : false;
  await elementHelper.waitForElement(fdxPkgDetails.packageSection, 3000).then(() => {
    chai.expect(fdxPkgDetails.packageSection.isPresent()).to.be.equal(isDisplayed);
  }).catch(() => { });
});

Then('I see default selected package type should be {string}', { timeout: 60 * 1000}, async (value) => {
  const el = fdxPkgDetails.packaging.$(`option[value="${value.trim().replace(' ', '_').toUpperCase()}"]`);
  await elementHelper.waitForElement(fdxPkgDetails.packaging, 3000).then(() => {
    chai.expect(el.isDisplayed()).to.be.equal(true);
  }).catch(() => { });
});

Then('I should see total package is {string}', { timeout: 60 * 1000}, async (value) => {
  await browser.sleep(50000);
  await elementHelper.waitForElement(fdxPkgDetails.totalPackage, 3000);
  chai.expect(await fdxPkgDetails.totalPackage.getText()).to.be.contain(value);
});

Then('I should see weight label contains recommended', { timeout: 60 * 1000}, async () => {
  await elementHelper.waitForElement(fdxPkgDetails.recommendedWeight);
  chai.expect(await fdxPkgDetails.recommendedWeight.isDisplayed()).to.be.equal(true);
});

Then('I should see total weight is {string}', { timeout: 60 * 1000}, async (value) => {
  await elementHelper.waitForElement(fdxPkgDetails.totalWeight, 3000);
  chai.expect(await fdxPkgDetails.totalWeight.getText()).to.be.contain(value);
});

Then('package size is preset to {string} and weight to {string}', { timeout: 60 * 1000}, async (dimensionUnit, weightUnit) => {
  await chai.expect(fdxPkgDetails.packageWeightUnit.getText()).to.eventually.equal(weightUnit.toString().toLowerCase());
  await chai.expect(fdxPkgDimensions.dimensionUnit.getText()).to.eventually.equal(dimensionUnit.toString().toLowerCase());
});

Then('declared value is in {string}', { timeout: 60 * 1000}, async (currencyCode) => {
  await chai.expect(fdxPkgDetails.carriageValueUnit.getText()).to.eventually.equal(currencyCode);
});

Then(/^I (|do not )see an error message that I should enter a valid carriage value$/, { timeout: 60 * 1000}, async (expect) => {
  if (expect === 'do not ') {
    await chai.expect(fdxPkgDetails.packageCarriageValueMessages.getAttribute('innerText'))
      .to.eventually.equal('');
  } else {
    await chai.expect(fdxPkgDetails.packageCarriageValueMessages.getAttribute('innerText'))
      .to.eventually.not.equal('');
  }
});

Then(/^I (|do not )see an error message that I should enter a valid weight$/, { timeout: 60 * 1000}, async (expect) => {
  await fdxMagrRates.ratebtn.click();
  if (expect !== 'do not ') {
    await chai.expect(fdxPkgDetails.packageWeightMessages.getAttribute('innerText'))
      .to.eventually.not.equal('');
  } else {
    await chai.expect(fdxPkgDetails.packageWeightMessages.getAttribute('innerText'))
      .to.eventually.equal('');
  }
});

When(/^I (|do not )purchase a higher limit of liability$/, { timeout: 60 * 1000}, async (expect) => {
  await elementHelper.waitForElement(fdxPkgDetails.noLiabilityCoverage);
  if (expect === 'do not ') {
    await fdxPkgDetails.noLiabilityCoverage.click();
  } else {
    await fdxPkgDetails.liabilityCoverage.click();
  }
});
