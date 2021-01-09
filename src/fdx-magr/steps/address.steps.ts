import { Given, Then, When } from 'cucumber';
import * as chai from 'chai';
import * as chaiAsPromised from 'chai-as-promised';
import { protractor, browser, ExpectedConditions, by } from 'protractor';
import fdxMagr from '../page-objects/fdx-magr.po';
import fdxMagrRates from '../page-objects/rate-details.po';
import fdxAddressEntry from '../page-objects/address.po';
import elementHelper from '../page-objects/element-helper.po';
import * as faker from 'faker';

chai.use(chaiAsPromised);
const randomCharacter = faker.address.country();


Given('I interact with the app outside of the {string} field', { timeout: 60 * 1000 }, async (field) => {
  const el = field === 'From' ? fdxMagr.sendFrom : fdxMagr.sendTo;
  await elementHelper.waitForElement(el);
  await el.click();
  await el.sendKeys(protractor.Key.TAB);
});

Given('I ship from the {string} address in {string}', { timeout: 60 * 1000}, async (addressKey, validate) => {
  await fdxMagr.waitForResponse(1500);
  await elementHelper.waitForElement(fdxMagr.sendFrom);
  await fdxMagr.sendFrom.click();
  await fdxMagr.sendFrom.clear();
  await fdxMagr.sendFrom.sendKeys(addressKey);
  await elementHelper.waitForElement(fdxAddressEntry.autocompleteFrom);
  await fdxMagr.waitForResponse(1500);
  await browser.actions().sendKeys(protractor.Key.ARROW_DOWN).perform();
  await browser.actions().sendKeys(protractor.Key.ENTER).perform();
  await elementHelper.waitForElement(fdxAddressEntry.getcovidNotificationTitle(), 5000).then(() => {
    fdxAddressEntry.getcovidNotificationTitle().isDisplayed().then($result => {
      if ($result) {
        fdxAddressEntry.getcovidNotificationCloseButton().click();
      }
    });
 }).catch(() => { });
  await browser.wait(ExpectedConditions.visibilityOf(fdxMagr.sendFromAfterSelection), 5 * 1000).then(async () => {
    const value = await fdxMagr.sendFromAfterSelection.getAttribute('value');
    chai.expect((await fdxMagr.sendFromAfterSelection.$(`option[value="${value}"]`).getText())).to.be.contain(validate);
  }).catch(async () => {
    chai.expect(await fdxMagr.sendFrom.getAttribute('value')).to.be.contain(validate);
  });
});

Given('I enter {string} into {string}', { timeout: 60 * 1000 }, async (value, field) => {
  const addressKey = value === 'random characters' ? randomCharacter : value;
  const el = (field === 'From') ? fdxMagr.sendFrom : fdxMagr.sendTo;
  const autocompleteEl = (field === 'From') ? fdxAddressEntry.autocompleteFrom : fdxAddressEntry.autocompleteTo;
  await elementHelper.waitForElement(el);
  await el.click();
  await el.clear();
  await el.sendKeys(addressKey);
  await elementHelper.waitForElement(autocompleteEl);
});

Given('I clear {string} field', { timeout: 60 * 1000 }, async (field) => {
  let el;
  if (field === 'From') {
    el = fdxMagr.sendFrom;
  } else if (field === 'To') {
    el = fdxMagr.sendTo;
  } else if (field === 'From Manual Postal Code') {
    el = fdxAddressEntry.manualPostCode('from');
  } else if (field === 'To Manual Postal Code') {
    el = fdxAddressEntry.manualPostCode('to');
  } else if (field === 'From Manual City') {
    el = fdxAddressEntry.manualCityList('from');
  } else if (field === 'To Manual City') {
    el = fdxAddressEntry.manualCityList('to');
  }
  await elementHelper.waitForElement(el);
  await el.click();
  await el.clear();
});

Given('I ship to the {string} address in {string}', { timeout: 60 * 1000}, async (addressKey, validate) => {
  await elementHelper.waitForElement(fdxMagr.sendTo);
  await fdxMagr.sendTo.click();
  await fdxMagr.sendTo.clear();
  await fdxMagr.sendTo.sendKeys(addressKey);
  await elementHelper.waitForElement(fdxAddressEntry.autocompleteTo);
  await fdxMagr.waitForResponse(1500);
  await browser.actions().sendKeys(protractor.Key.ARROW_DOWN).perform();
  await browser.actions().sendKeys(protractor.Key.ENTER).perform();
  await elementHelper.waitForElement(fdxAddressEntry.getcovidNotificationTitle(), 5000).then(() => {
    fdxAddressEntry.getcovidNotificationTitle().isDisplayed().then($result => {
      if ($result) {
        fdxAddressEntry.getcovidNotificationCloseButton().click();
      }
    });
  }).catch(() => { });
  await browser.wait(ExpectedConditions.visibilityOf(fdxMagr.sendToAfterSelection), 5 * 1000).then(async () => {
    const value = await fdxMagr.sendToAfterSelection.getAttribute('value');
    chai.expect((await fdxMagr.sendToAfterSelection.$(`option[value="${value}"]`).getText())).to.be.contain(validate);
  }).catch(async () => {
    chai.expect(await fdxMagr.sendTo.getAttribute('value')).to.be.contain(validate);
  });
  await fdxMagr.waitForResponse(500);
});

// tslint:disable-next-line: max-line-length
Given('I ship from the {string} and select {string} from autocompletelist in {string}', { timeout: 60 * 1000}, async (addressKey, option, validate) => {
  await elementHelper.waitForElement(fdxMagr.sendFrom);
  await fdxMagr.sendFrom.click();
  await fdxMagr.sendFrom.clear();
  await fdxMagr.sendFrom.sendKeys(addressKey);
  await elementHelper.waitForElement(fdxAddressEntry.autocompleteFrom);
  await fdxMagr.waitForResponse(1500);
  await elementHelper.waitForElement(fdxAddressEntry.selectFromAutoCompleteList('From', option));
  await fdxAddressEntry.selectFromAutoCompleteList('From', option).click();
  await elementHelper.waitForElement(fdxAddressEntry.getcovidNotificationTitle(), 5000).then(() => {
    fdxAddressEntry.getcovidNotificationTitle().isDisplayed().then($result => {
      if ($result) {
        fdxAddressEntry.getcovidNotificationCloseButton().click();
      }
    });
  }).catch(() => { });
  await browser.wait(ExpectedConditions.visibilityOf(fdxMagr.sendFromAfterSelection), 5 * 1000).then(async () => {
    const value = await fdxMagr.sendFromAfterSelection.getAttribute('value');
    chai.expect((await fdxMagr.sendFromAfterSelection.$(`option[value="${value}"]`).getText())).to.be.contain(validate);
  }).catch(async () => {
    chai.expect(await fdxMagr.sendFrom.getAttribute('value')).to.be.contain(validate);
  });
});

// tslint:disable-next-line: max-line-length
Given('I ship to the {string} and select {string} from autocompletelist in {string}', { timeout: 60 * 1000}, async (addressKey, option, validate) => {
  await elementHelper.waitForElement(fdxMagr.sendTo);
  await fdxMagr.sendTo.click();
  await fdxMagr.sendTo.clear();
  await fdxMagr.sendTo.sendKeys(addressKey);
  await elementHelper.waitForElement(fdxAddressEntry.autocompleteTo);
  await fdxMagr.waitForResponse(1500);
  await elementHelper.waitForElement(fdxAddressEntry.selectFromAutoCompleteList('To', option));
  await fdxAddressEntry.selectFromAutoCompleteList('To', option).click();
  await elementHelper.waitForElement(fdxAddressEntry.getcovidNotificationTitle(), 5000).then(() => {
    fdxAddressEntry.getcovidNotificationTitle().isDisplayed().then($result => {
      if ($result) {
        fdxAddressEntry.getcovidNotificationCloseButton().click();
      }
    });
  }).catch(() => { });
  await browser.wait(ExpectedConditions.visibilityOf(fdxMagr.sendToAfterSelection), 5 * 1000).then(async () => {
    const value = await fdxMagr.sendToAfterSelection.getAttribute('value');
    chai.expect((await fdxMagr.sendToAfterSelection.$(`option[value="${value}"]`).getText())).to.be.contain(validate);
  }).catch(async () => {
    chai.expect(await fdxMagr.sendTo.getAttribute('value')).to.be.contain(validate);
  });
});

Given('I choose first proposed option in autocomplete form', { timeout: 60 * 1000 }, async () => {
  await fdxMagr.waitForResponse(1500);
  await browser.actions().sendKeys(protractor.Key.ARROW_DOWN).perform();
  await browser.actions().sendKeys(protractor.Key.ENTER).perform();
  await elementHelper.waitForElement(fdxAddressEntry.getcovidNotificationTitle(), 5000).then(() => {
    fdxAddressEntry.getcovidNotificationTitle().isDisplayed().then($result => {
      if ($result) {
        fdxAddressEntry.getcovidNotificationCloseButton().click();
      }
    });
  }).catch(() => { });
});

Given('I see option to enter manual address in {string} section', { timeout: 60 * 1000}, async (field) => {
  await elementHelper.waitForElement(fdxAddressEntry.manualAddressInformation(field));
  await elementHelper.waitForElement(fdxAddressEntry.manualEntryLink(field));
  await chai.expect(fdxAddressEntry.manualEntryLink(field).isDisplayed()).to.eventually.be.true;
});

Given('I see option to reset manual address in {string} section', { timeout: 60 * 1000}, async (field) => {
  await elementHelper.waitForElement(fdxAddressEntry.resetManualAddress(field));
  await chai.expect(fdxAddressEntry.resetManualAddress(field).isDisplayed()).to.eventually.be.true;
});

Given('I should see continue button', { timeout: 60 * 1000}, async () => {
  await elementHelper.waitForElement(fdxAddressEntry.manualContinueBtn);
  await chai.expect(fdxAddressEntry.manualContinueBtn.isDisplayed()).to.eventually.be.true;
});
Given('I should see the {string} button', { timeout: 60 * 1000 }, async (text) => {
  if (text === 'show transit times') {
    await elementHelper.waitForElement(fdxMagrRates.transitbtn);
    await chai.expect(fdxMagrRates.transitbtn.isDisplayed()).to.eventually.be.true;
    await chai.expect(fdxMagrRates.transitbtn.getText()).to.eventually.to.contain(text.toLocaleUpperCase());
  } else {
    await elementHelper.waitForElement(fdxMagrRates.ratebtn);
    await chai.expect(fdxMagrRates.ratebtn.isDisplayed()).to.eventually.be.true;
    await chai.expect(fdxMagrRates.ratebtn.getText()).to.eventually.to.contain(text.toLocaleUpperCase());
  }
});

Given('I should see showrates button', { timeout: 60 * 1000}, async () => {
  await elementHelper.waitForElement(fdxMagrRates.ratebtn);
  await chai.expect(fdxMagrRates.ratebtn.isDisplayed()).to.eventually.be.true;
});

Given('I select reset origin', { timeout: 60 * 1000}, async () => {
    await elementHelper.waitForElement(fdxAddressEntry.resetOriginBtn);
    await fdxAddressEntry.resetOriginBtn.click();
});

Given('I select reset destination', { timeout: 60 * 1000}, async () => {
    await elementHelper.waitForElement(fdxAddressEntry.resetDestinationBtn);
    await fdxAddressEntry.resetDestinationBtn.click();
});

Given('I select {string} as {string} from list of countries', { timeout: 60 * 1000}, async (countryName, countryType) => {
  const field = countryType === 'origin' ? 'From' : 'To';
  await elementHelper.waitForElement(fdxAddressEntry.manualCountryList(field.toLowerCase()));
  await fdxAddressEntry.manualCountryList(field.toLowerCase()).click();
  await elementHelper.waitForElement(fdxAddressEntry.selectCountry(field.toLowerCase(), countryName));
  await fdxAddressEntry.selectCountry(field.toLowerCase(), countryName).click();
  await elementHelper.waitForElement(fdxAddressEntry.getcovidNotificationTitle(), 5000).then(() => {
    fdxAddressEntry.getcovidNotificationTitle().isDisplayed().then($result => {
      if ($result) {
        fdxAddressEntry.getcovidNotificationCloseButton().click();
      }
    });
 }).catch(() => { });
});

// Given('I select {string} as {string} city', { timeout: 60 * 1000}, async (cityName, cityType) => {
//   const field = cityType === 'origin' ? 'Origin' : 'Destination';
//   await elementHelper.waitForElement(fdxAddressEntry.manualCityList(field.toLocaleLowerCase()));
//   await fdxAddressEntry.manualCityList(field.toLowerCase()).click();
//   // await fdxAddressEntry.manualCityList(field).click();
//   await fdxAddressEntry.manualCityList(field).sendKeys(cityName);
//   await fdxMagr.waitForResponse(500);
//   await browser.actions().sendKeys(protractor.Key.ARROW_DOWN).perform();
//   await browser.actions().sendKeys(protractor.Key.ENTER).perform();
// });

Given('I select {string} as {string} city', { timeout: 60 * 1000}, async (cityName, cityType) => {
  const field = cityType === 'origin' ? 'From' : 'To';
  await elementHelper.waitForElement(fdxAddressEntry.manualCityList(field.toLowerCase()));
  await fdxAddressEntry.manualCityList(field.toLowerCase()).click();
  await fdxAddressEntry.manualCityList(field.toLowerCase()).sendKeys(cityName);
  await fdxMagr.waitForResponse(500);
  await browser.sleep(1000); // select animation
  await elementHelper.waitForElement(fdxAddressEntry.selectCity(field.toLowerCase(), cityName));
  await fdxAddressEntry.selectCity(field.toLowerCase(), cityName).click();
});

Given('I enter {string} code {string} as {string}', { timeout: 60 * 1000}, async (label, zipCode, zipType) => {
  const field = zipType === 'origin' ? 'From' : 'To';
  await elementHelper.waitForElement(fdxAddressEntry.manualPostCode(field.toLowerCase()));
  await chai.expect(fdxAddressEntry.manualPostCodeLabel(field.toLowerCase()).getText()).to.eventually.contain(label);
  await fdxAddressEntry.manualPostCode(field.toLowerCase()).sendKeys(zipCode);
  await elementHelper.waitForElement(fdxAddressEntry.getcovidNotificationTitle(), 5000).then(() => {
    fdxAddressEntry.getcovidNotificationTitle().isDisplayed().then($result => {
      if ($result) {
        fdxAddressEntry.getcovidNotificationCloseButton().click();
      }
    });
 }).catch(() => { });
});

Then('I should see the app shows that location in the {string} field', { timeout: 60 * 1000}, async (field) => {
  const afterSelectionEl = field === 'From' ? fdxMagr.sendFromAfterSelection : fdxMagr.sendToAfterSelection;
  const el = field === 'From' ? fdxMagr.sendFrom : fdxMagr.sendTo;
  const validate = randomCharacter;
  await browser.wait(ExpectedConditions.visibilityOf(afterSelectionEl), 5 * 1000).then(async () => {
    const value = await afterSelectionEl.getAttribute('value');
    chai.expect((await afterSelectionEl.$(`option[value="${value}"]`).getText())).to.be.contain(validate);
  }).catch(async () => {
    chai.expect(await el.getAttribute('value')).to.be.contain(validate);
  });
});

Then('I should see the SENDER NAME pre-filled', { timeout: 60 * 1000}, async () => {
  await elementHelper.waitForElement(fdxMagr.sendFrom);
  await chai.expect(fdxMagr.sendFrom.getAttribute('value')).to.eventually.exist;
});

Then('the app only shows me the possibility the enter a location manually in {string} field', { timeout: 60 * 1000}, async (field) => {
  const el = field === 'From' ? fdxAddressEntry.autocompleteFrom : fdxAddressEntry.autocompleteTo;
  await elementHelper.waitForElement(el);
  await fdxMagr.waitForResponse(1500);
  const autocompleteForm = (await el.getWebElement()).getDriver();
  const listOfResult = await autocompleteForm.findElements(by.css('li[role="option"]'));
  chai.expect(listOfResult.length).to.be.equal(1);
  chai.expect(await fdxAddressEntry.enterTheAddressYourselfBtn.isDisplayed()).to.be.equal(true);
});

Then('The dropdown of {string} field shows results that match the {string}', { timeout: 60 * 1000 }, async (field, value) => {
  const autocompleteEl = (field === 'From') ? fdxAddressEntry.autocompleteFrom : fdxAddressEntry.autocompleteTo;
  await elementHelper.waitForElement(autocompleteEl);
  await fdxMagr.waitForResponse(1500);
  const autocompleteForm = (await autocompleteEl.getWebElement()).getDriver();
  const listOfResult = await autocompleteForm.findElements(by.css('li[role="option"]'));
  listOfResult.forEach(async el => {
    chai.expect(await el.getText()).to.be.contain(value);
  });
});

Then('I should see the app proposes a list of possible locations in {string} field', { timeout: 60 * 1000 }, async (field) => {
  const el = field === 'From' ? fdxAddressEntry.autocompleteFrom : fdxAddressEntry.autocompleteTo;
  await elementHelper.waitForElement(el);
  chai.expect(await el.isDisplayed()).to.be.equal(true);
});

When('I delete the SENDER NAME and refresh page', { timeout: 60 * 1000}, async () => {
  await elementHelper.waitForElement(fdxMagr.sendFrom);
  await fdxMagr.sendFrom.click();
  await fdxMagr.sendFrom.clear();
  await browser.refresh();
});

When('I click Liability Info button', { timeout: 60 * 1000}, async () => {
  await elementHelper.waitForElement(fdxMagr.liabilityInfoButton);
  await fdxMagr.liabilityInfoButton.click();
});

When('I click on Ship button', { timeout: 10 * 1000}, async () => {
  await elementHelper.waitForElement(fdxMagr.shipButton);
  // await fdxMagr.shipButton.click();
  await browser.executeScript('arguments[0].click()', fdxMagr.shipButton);
});

// need to investigate. It doesn't work
Given('I see error message {string} for {string} postcode', { timeout: 60 * 1000}, async (errorMsg, zipType) => {
  const field = zipType === 'origin' ? 'From' : 'To';
  await elementHelper.waitForElement(fdxAddressEntry.postcodeError(field).postError.requiredError);
  await chai.expect(fdxAddressEntry.postcodeError(field).postError.requiredError.getAttribute('innerText')).to.eventually.contain(errorMsg);
  // tslint:disable-next-line:max-line-length
  await chai.expect(fdxAddressEntry.postcodeError(field).postError.minLengthError.getAttribute('innerText')).to.eventually.contain(errorMsg);
});

Given('I continue to ship using manual address search', { timeout: 60 * 1000}, async () => {
  await elementHelper.waitForElement(fdxAddressEntry.manualContinueBtn);
  await fdxAddressEntry.manualContinueBtn.click();
});

Given('I should see Continue button', { timeout: 60 * 1000}, async () => {
  await elementHelper.waitForElement(fdxAddressEntry.manualContinueBtn);
  chai.expect(await fdxAddressEntry.manualContinueBtn.isDisplayed()).to.be.equal(true);
});

Given('I click Enter the Address Yourself button', { timeout: 60 * 1000 }, async () => {
  await elementHelper.waitForElement(fdxAddressEntry.enterTheAddressYourselfBtn);
  await fdxAddressEntry.enterTheAddressYourselfBtn.click();
});

Given('I continue to ship using manual address search in {string} section', { timeout: 60 * 1000}, async (field) => {
  await elementHelper.waitForElement(fdxAddressEntry.manualAddressInformation(field));
  await chai.expect(fdxAddressEntry.manualEntryLink(field).isDisplayed()).to.eventually.be.true;
  await fdxAddressEntry.manualEntryLink(field).click();
});

Then('I should see the app shows {string} as country in {string} field', { timeout: 60 * 1000 }, async (value, field) => {
  value = value === 'empty' ? '' : value;
  await elementHelper.waitForElement(fdxAddressEntry.manualCountryList(field));
  const countryCode = await fdxAddressEntry.manualCountryList(field).getAttribute('value');
  chai.expect(await fdxAddressEntry.manualCountryList(field).$(`option[value="${countryCode}"]`).getText()).to.be.contain(value);
});

Then('I should see the app shows {string} as zipcode in {string} field', { timeout: 60 * 1000 }, async (value, field) => {
  value = value === 'empty' ? '' : value;
  await elementHelper.waitForElement(fdxAddressEntry.manualPostCode(field));
  chai.expect(await fdxAddressEntry.manualPostCode(field).getAttribute('value')).to.be.equal(value);
});

Then('I should see the app shows {string} as manual city in {string} field', { timeout: 60 * 1000 }, async (value, field) => {
  value = value === 'empty' ? '' : value;
  await elementHelper.waitForElement(fdxAddressEntry.manualCityList(field));
  chai.expect(await fdxAddressEntry.manualCityList(field).getAttribute('value')).to.be.equal(value);
});

Given('I enter {string} in {string} field and proceed to manual entry', { timeout: 60 * 1000}, async (value, field) => {
  await fdxMagr.waitForResponse(1500);
  const el = field === 'From' ? fdxMagr.sendFrom : fdxMagr.sendTo;
  await el.click();
  await el.clear();
  await el.sendKeys(value);
  await fdxMagr.waitForResponse(1500);
  await elementHelper.waitForElement(fdxAddressEntry.enterTheAddressYourselfBtn);
  await fdxAddressEntry.enterTheAddressYourselfBtn.click();
  await elementHelper.waitForElement(fdxAddressEntry.getcovidNotificationTitle(), 5000).then(() => {
    fdxAddressEntry.getcovidNotificationTitle().isDisplayed().then($result => {
      if ($result) {
        fdxAddressEntry.getcovidNotificationCloseButton().click();
      }
    });
 }).catch(() => { });
});

Then('I see a message that in {string} domestic shipping is not allowed', { timeout: 60 * 1000}, async (country) => {
  const domesticMessage = `Please login with an account enabled for domestic shipping in ${country} or contact FedEx Customer Service.`;
  await elementHelper.waitForElement(fdxAddressEntry.domesticShippingNotAllowed);
  chai.expect(await fdxAddressEntry.domesticShippingNotAllowed.getText()).to.be.contain(domesticMessage);
});

Then('I am redirected to correct {string} with or without {string}', { timeout: 60 * 1000}, async (returnLocation, shipEntryAction) => {
  await browser.wait(protractor.ExpectedConditions.urlContains(returnLocation), 60 * 1000);
  chai.expect((await browser.getCurrentUrl()).toLowerCase()).to.contains(returnLocation);
  if (shipEntryAction === 'true') {
    chai.expect((await browser.getCurrentUrl()).toLowerCase()).to.contains('shipentryaction');
  }
});

Then('I am redirected to {string}', { timeout: 60 * 1000}, async (application) => {
  await browser.sleep(2500);
  chai.expect((await browser.getCurrentUrl()).toLowerCase()).to.contains(application);
  chai.expect((await browser.getCurrentUrl())).to.contains(application);
});

Then('the locale is set to {string}', { timeout: 60 * 1000}, async (returnLocale) => {
  await browser.sleep(2500);
  chai.expect((await browser.getCurrentUrl())).to.contains(returnLocale);
  const appUrl = await browser.getCurrentUrl().then((text) => text);
  if (appUrl.indexOf('lite-ship.html') >= 0 ) {
    returnLocale.toLowerCase().replace('_', '-');
  }
});

// tslint:disable-next-line: max-line-length
Then('the origin and language is set to {string} and {string} for {string} packages', { timeout: 60 * 1000}, async (countryCode, langCode, packageqty) => {
  await browser.sleep(2500);
  if (packageqty.toLocaleLowerCase() === 'multiple') {
    chai.expect((await browser.getCurrentUrl())).to.contains('origincountry=' + countryCode);
  }
  chai.expect((await browser.getCurrentUrl())).to.contains(countryCode);
  chai.expect((await browser.getCurrentUrl())).to.contains(langCode);
  // chai.expect((await browser.getCurrentUrl())).to.not.contain('&HIFlag=U');
});

Then('I should see message {string}', { timeout: 60 * 1000}, async (LiabilityMessage) => {
  await elementHelper.waitForElement(fdxMagr.liabilityTooltipContent);
  chai.expect(await fdxMagr.liabilityTooltipContent.getAttribute('innerText')).to.contains(LiabilityMessage);
});

Then('Fedex Service Guide link should be visible', { timeout: 60 * 1000}, async () => {
  await elementHelper.waitForElement(fdxMagr.fedexServiceGuideLink);
  // tslint:disable-next-line: no-unused-expression
  chai.expect(await fdxMagr.fedexServiceGuideLink.isDisplayed()).to.be.true;
});

// Then('I see a system error popup', {timeout: 60 * 1000}, async () => {
//   await elementHelper.waitForElement(fdxAddressEntry.systemErrorPopUp);
//   await chai.expect(fdxAddressEntry.systemErrorPopUp.isDisplayed()).to.eventually.true;

Then('I see that intra-country message is shown', { timeout: 60 * 1000}, async () => {
  const domesticMessage = 'Intra-country service is not available in this country.';
  await elementHelper.waitForElement(fdxAddressEntry.intraCountryShippingNotAllowed);
  await chai.expect(fdxAddressEntry.intraCountryShippingNotAllowed.getText()).to.eventually.contain(domesticMessage);
});

Then('I should see warning Fedex does not service message in {string} field', { timeout: 60 * 1000 }, async (field) => {
  await elementHelper.waitForElement(fdxAddressEntry.warningFedexDoesNotServiceMessage(field));
  chai.expect(await fdxAddressEntry.warningFedexDoesNotServiceMessage(field).isDisplayed()).to.be.equal(true);
});

Then('I should see warning Address Required Message in {string} field', { timeout: 60 * 1000 }, async (field) => {
  await elementHelper.waitForElement(fdxAddressEntry.warningAddressRequiredMessage(field));
  chai.expect(await fdxAddressEntry.warningAddressRequiredMessage(field).isDisplayed()).to.be.equal(true);
});

Then('empty From and To fields are shown', { timeout: 60 * 1000}, async () => {
  await elementHelper.waitForElement(fdxMagr.sendFrom);
  chai.expect(await fdxMagr.sendFrom.isDisplayed()).to.be.equal(true);
  chai.expect(await fdxMagr.sendFrom.getAttribute('value')).to.be.contain('');
  chai.expect(await fdxMagr.sendTo.isDisplayed()).to.be.equal(true);
  chai.expect(await fdxMagr.sendTo.getAttribute('value')).to.be.contain('');
});

Then('I see {string} in manual {string} field', { timeout: 60 * 1000}, async (text, field) => {
  const el = field === 'From' ? fdxMagr.sendFromAfterSelection : fdxMagr.sendToAfterSelection;
  await elementHelper.waitForElement(el);
  const value = await el.getAttribute('value');
  chai.expect(await el.$(`option[value="${value}"]`).getText()).to.be.contain(text);
});

// Then('I close system error pop-up', { timeout: 60 * 1000 }, async () => {
//   await elementHelper.waitForElement(fdxMagr.errorModal.window);
//   await fdxMagr.errorModal.close.click();
// });

Then(/^I see an error message when not using a correct postal code format from "(.*)" in (From|To) section$/,
  { timeout: 60 * 1000}, async (formatsCSV, section) => {
  await elementHelper.waitForElement(fdxAddressEntry.manualPostCode(section.toString().toLocaleLowerCase()));
  const formats = formatsCSV.split(',');
  let count = 0;
  while (count < formats.length) {
    let postalCode = '0';
    let count2 = 0;
    const format = formats[count].trim().split('');

    while (count2 < format.length) {
      if (format[count2].toLocaleUpperCase() === 'N') {
        postalCode = postalCode + '0';
      } else if (format[count2].toLocaleUpperCase() === 'A') {
        postalCode = postalCode + 'X';
      }
      count2++;
    }
    await fdxAddressEntry.manualPostCode(section.toString().toLocaleLowerCase()).clear();
    await fdxAddressEntry.manualPostCode(section.toString().toLocaleLowerCase()).sendKeys(postalCode);
    await browser.actions().sendKeys(protractor.Key.TAB).perform();

    await elementHelper.waitForElement(fdxAddressEntry.postcodeError(section.toString().toLocaleLowerCase()).postError.invalidError);
    await chai.expect(fdxAddressEntry.postcodeError(section.toString().toLocaleLowerCase())
      .postError.invalidError.getAttribute('innerText'))
      .to.eventually.contain(formatsCSV.toString().replace(/,/g, ', '));
    count++;
  }
});

Then(/^I do not see error message when using a correct postal code "(.*)" in (From|To) section$/,
  { timeout: 60 * 1000}, async ( postalCode, section) => {
  await elementHelper.waitForElement(fdxAddressEntry.manualPostCode(section.toString().toLocaleLowerCase()));
  await fdxAddressEntry.manualPostCode(section.toString().toLocaleLowerCase()).clear();
  await fdxAddressEntry.manualPostCode(section.toString().toLocaleLowerCase()).sendKeys(postalCode);
  await browser.actions().sendKeys(protractor.Key.TAB).perform();

  await chai.expect(browser.isElementPresent(fdxAddressEntry.postcodeError(section.toString().toLocaleLowerCase())
    .postError.invalidError)).to.eventually.be.false;
});

Then('I saw {string} of {string} field is not displayed', { timeout: 60 * 1000}, async (field, destination) => {
  const fieldEl = field === 'city' ? fdxAddressEntry.manualCityList(destination) : fdxAddressEntry.manualPostCode(destination);
  await fieldEl.isPresent().then(isTrue => {
    chai.expect(isTrue).to.be.equal(false);
  });
});

