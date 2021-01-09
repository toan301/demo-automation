import { Given, When, Then } from 'cucumber';
import * as chai from 'chai';
import * as chaiAsPromised from 'chai-as-promised';
import { protractor } from 'protractor/built/ptor';
import { browser } from 'protractor';

import fdxMagr from '../page-objects/fdx-magr.po';
import fdxMagrRates from '../page-objects/rate-details.po';
import elementHelper from '../page-objects/element-helper.po';

chai.use(chaiAsPromised);
let shipDate;

When('I request rates', { timeout: 60 * 1000 }, async () => {
  await elementHelper.waitForElement(fdxMagrRates.ratebtn, 5000);
  await chai.expect(fdxMagrRates.ratebtn.isDisplayed()).to.eventually.be.true;
  await elementHelper.scrollElementIntoView(fdxMagrRates.ratebtn);
  await fdxMagrRates.ratebtn.click();
  await elementHelper.waitForElement(fdxMagrRates.rateSection.ratelist);
});

When('I click Transit button', { timeout: 60 * 1000 }, async () => {
  await elementHelper.waitForElement(fdxMagrRates.transitbtn, 5000);
  await chai.expect(fdxMagrRates.transitbtn.isDisplayed()).to.eventually.be.true;
  await elementHelper.scrollElementIntoView(fdxMagrRates.transitbtn);
  await fdxMagrRates.transitbtn.click();
});

Given('rates and delivery information is shown to the {string} user', { timeout: 60 * 1000 }, async (userType) => {
  const rateMessageForUser = 'Here are your Account-Specific Rates and delivery dates for shipments sent';
  const rateMessageForAnonymous = 'Here are the rates and delivery dates for shipments sent';
  await browser.wait(protractor.ExpectedConditions.presenceOf(fdxMagrRates.rateSection.title), 6000);
  if (userType === 'anonymous') {
    await chai.expect(fdxMagrRates.rateSection.title.getText()).to.eventually.contain(rateMessageForAnonymous);
    return;
  } else {
    await chai.expect(fdxMagrRates.rateSection.title.getText()).to.eventually.contain(rateMessageForUser);
  }
});

Given('I check View signature options', { timeout: 60 * 1000 }, async () => {
  await elementHelper.waitForElement(fdxMagrRates.signatureOptions.label);
  if (!(await fdxMagrRates.signatureOptions.checkbox.getAttribute('checked'))) {
    await browser.executeScript('arguments[0].click();', fdxMagrRates.signatureOptions.checkbox.getWebElement());
  }
});

Given('I view signature options I see {string} is selected', { timeout: 60 * 1000 }, async (type) => {
  await elementHelper.waitForElement(fdxMagrRates.signatureOptions.label);
  await elementHelper.scrollElementIntoView(fdxMagrRates.signatureOptions.label);
  await chai.expect(fdxMagrRates.signatureOptions.tooltip.isDisplayed()).to.eventually.be.true;
  await fdxMagrRates.signatureOptions.label.click();
  await elementHelper.waitForElement(fdxMagrRates.signatureOptions.signatureType(type));

  await chai.expect(fdxMagrRates.signatureOptions.signatureType(type).isPresent()).to.eventually.be.true;
  await chai.expect(fdxMagrRates.signatureOptions.selectedOption.getAttribute('id')).to.eventually.equal('option' + type);
});

When('I want the {string} signature option for my shipment', { timeout: 60 * 1000 }, async (type) => {
  await elementHelper.waitForElement(fdxMagrRates.signatureOptions.signatureType(type));
  await fdxMagrRates.signatureOptions.signatureType(type).click();
});

Then('I see view signature options along with i want shipment picked up checkbox', { timeout: 60 * 1000 }, async () => {
  await elementHelper.waitForElement(fdxMagrRates.pickupOtions.shipmentPickup);
  await chai.expect(await fdxMagrRates.pickupOtions.shipmentPickup.isPresent()).to.be.equal(true);
  await elementHelper.waitForElement(fdxMagrRates.signatureOptions.label);
  await chai.expect(await fdxMagrRates.signatureOptions.label.isPresent()).to.be.equal(true);
});

Then('rate list is shown', { timeout: 60 * 1000 }, async () => {
  await elementHelper.waitForElement(fdxMagrRates.rateSection.ratelist);
  await chai.expect(fdxMagrRates.rateSection.ratelist.isDisplayed()).to.eventually.be.true;
});

Then (/^I (can|cannot) choose to have the shipment picked up$/, { timeout: 60 * 1000 }, async (expect) => {
  const expectVisibility = expect === 'can';
  if (expectVisibility) {
    await elementHelper.waitForElement(fdxMagrRates.pickupOtions.shipmentPickupLabel);
    await chai.expect(fdxMagrRates.pickupOtions.shipmentPickupLabel.isDisplayed()).to.eventually.equal(expectVisibility);
  } else {
    await chai.expect(fdxMagrRates.pickupOtions.shipmentPickupLabel.isPresent()).to.eventually.be.false;
  }
});

When('I choose to have the shipment picked up', { timeout: 60 * 1000 }, async () => {
  await elementHelper.waitForElement(fdxMagrRates.pickupOtions.shipmentPickupLabel);
  if (!(await fdxMagrRates.pickupOtions.schedulePickup.isPresent())) {
    await browser.executeScript('arguments[0].click();', fdxMagrRates.pickupOtions.shipmentPickup);
  }
});

Then('I can choose I already have a scheduled pickup', { timeout: 60 * 1000 }, async () => {
  await chai.expect(fdxMagrRates.pickupOtions.schedulePickup.isDisplayed()).to.eventually.be.true;
  await chai.expect(fdxMagrRates.pickupOtions.alreadySchedulePickup.isDisplayed()).to.eventually.be.true;
});

When('I choose I have already scheduled a pickup', { timeout: 60 * 1000 }, async () => {
  await chai.expect(fdxMagrRates.pickupOtions.alreadySchedulePickup.isDisplayed()).to.eventually.be.true;
  await fdxMagrRates.pickupOtions.alreadySchedulePickup.click();
});

Given('I check signup message is shown for anonymous user', { timeout: 60 * 1000 }, async () => {
  await chai.expect(fdxMagr.signupnotifications.anonymousLoginMsg.isDisplayed()).to.eventually.be.true; // both
  await chai.expect(fdxMagr.signupnotifications.accountImportMsg.isDisplayed()).to.eventually.be.true; // international
});

When(/^I see SHIP label (is|is not) shown in quotes$/, { timeout: 60 * 1000 }, async (expect) => {
  await elementHelper.waitForElementRemoval(fdxMagr.loader.waitForPageLoader);
  await elementHelper.waitForElement(fdxMagrRates.rateSection.ratelist);

  if (expect === 'is not') {
    await chai.expect(fdxMagrRates.rateSection.quotes.get(0).getText()).to.eventually.not.contain('SHIP');
    return;
  } else {
    await chai.expect(fdxMagrRates.rateSection.quotes.get(0).getText()).to.eventually.contain('SHIP');
    return;
  }
});

Then(/^I see AMOUNTS ARE SHOWN label (is|is not) displayed over rate section$/, { timeout: 60 * 1000 }, async (expect) => {
  await elementHelper.waitForElementRemoval(fdxMagr.loader.waitForPageLoader);
  await elementHelper.waitForElement(fdxMagrRates.rateSection.ratelist);

  if (expect === 'is not') {
    await chai.expect(fdxMagrRates.rateSection.ammountShown.isPresent()).to.eventually.be.false;
    return;
  } else {
    await chai.expect(fdxMagrRates.rateSection.ammountShown.isDisplayed()).to.eventually.be.true;
    return;
  }
});

Then('I choose ship date from list row {int}', { timeout: 60 * 1000 }, async (dateNumber) => {
  await fdxMagr.shipDate.click();
  await fdxMagr.selectShipDate().get(dateNumber - 1).click();
  shipDate = await fdxMagr.selectShipDate().get(dateNumber - 1).getText().then((text) => text);
});

Then('I see selected ship date matches date in ship summary', { timeout: 60 * 1000 }, async () => {
  await chai.expect(fdxMagrRates.rateSection.title.getText()).to.eventually.contain(shipDate);
});

Then('I see please notes link and text shown as {string}', { timeout: 60 * 1000 }, async (text) => {
  await elementHelper.waitForElement(fdxMagrRates.pleaseNotes);
  await elementHelper.scrollElementIntoView(fdxMagrRates.pleaseNotes);
  await chai.expect(fdxMagrRates.pleaseNotes.isDisplayed()).to.eventually.be.true;
  await chai.expect(fdxMagrRates.pleaseNotes.getText()).to.eventually.contain(text);
  await fdxMagrRates.pleaseNotes.click();
  await chai.expect(fdxMagrRates.pleaseNotes.getText()).to.eventually.not.contain(text);
});

Then('I see advance rating link', { timeout: 60 * 1000 }, async () => {
  await elementHelper.scrollElementIntoView(fdxMagrRates.rateSection.ratelist);
  await chai.expect(fdxMagrRates.advanceRating.isDisplayed()).to.eventually.be.true;
});

Then('I check app-bar is displayed', { timeout: 60 * 1000 }, async () => {
  await chai.expect(fdxMagr.appBarComponent.appbar.isDisplayed()).to.eventually.be.true;
});

Then('I select account {string} from app-bar', { timeout: 60 * 1000 }, async (account) => {
  await fdxMagr.appBarComponent.menuItem.get(0).click();
  await fdxMagr.appBarComponent.selectAccount(account).click();
});

Then('I check sub-menu item {string} is displayed under {string} menu-item', { timeout: 60 * 1000 }, async (iteName, menuItem) => {
  await fdxMagr.appBarComponent.kebabIcon.click();
  await fdxMagr.appBarComponent.chevronIcons(menuItem).click();
  await chai.expect(fdxMagr.appBarComponent.menuItemElement(iteName).getText()).to.eventually.to.contain(iteName);
  await fdxMagr.appBarComponent.kebabIcon.click();
});

