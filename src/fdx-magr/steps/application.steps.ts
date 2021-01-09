
import { Given, When, Then } from 'cucumber';
import { protractor, browser, ExpectedConditions } from 'protractor';
import * as chai from 'chai';
import * as chaiAsPromised from 'chai-as-promised';
import testData from '../../data/e2e-test-data';
import fdxMagr from '../page-objects/fdx-magr.po';
import elementHelper from '../page-objects/element-helper.po';
import fdxLogin from '../page-objects/login-details.po';

chai.use(chaiAsPromised);

Given('I browse to MAGR application', { timeout: 60 * 1000 }, async () => {
  await browser.get(`${browser.baseUrl}${browser.params.fullUrl}`);
  await elementHelper.waitForElementRemoval(fdxMagr.loader.waitForPageLoader);
  await browser.sleep(1000); // Allow translations to load
});
 // This step takes you to actual AEM page with MAGR which is slow. So currently we are not using it
Given('I browse to MAGR application on {string} testlevel', { timeout: 60 * 1000 }, async (levelName) => {
  const testUrl = testData.testlevel.fedex.env[levelName];
  await browser.get(`${testUrl}`);
  await elementHelper.waitForElement(fdxMagr.loader.waitForPageLoader);
  await elementHelper.waitForElementRemoval(fdxMagr.loader.waitForPageLoader);
});

Given('I set the cookie {string}', { timeout: 60 * 1000 }, async (locale: string) => {
  const cookie = {
    name: 'fdx_locale',
    value: locale,
    expires: 'Fri, 3 Aug 2101 20:47:11 UTC',
    path: '/'
  };
  await browser.manage().addCookie(cookie);
});

Given('I clear all cookies', { timeout: 60 * 1000 }, async () => {
  await browser.manage().deleteAllCookies();
});

Given('I refresh page', { timeout: 60 * 1000 }, async () => {
  await browser.refresh();
});

Given(/^I check appbar (is|is not) shown$/, { timeout: 60 * 1000 }, async (expect) => {
  await elementHelper.waitForElement(fdxMagr.sendFrom);
  if (expect === 'is not') {
    await chai.expect(fdxMagr.appBarComponent.appbar.isPresent()).to.eventually.be.false;
    return;
  } else {
    await chai.expect(fdxMagr.appBarComponent.appbar.isDisplayed()).to.eventually.be.true;
    return;
  }
});

Given('I login as {string} user', (userDetails) => {
  const userName = testData.users.fedex[userDetails].username;
  const password = testData.users.fedex[userDetails].password;
  return protractor.promise.all([
    elementHelper.waitForElement(fdxLogin.login.loginLink) as any,
    fdxLogin.login.loginLink.click(),
    elementHelper.waitForElement(fdxLogin.login.loginButton),
    fdxLogin.login.userName.click(),
    fdxLogin.login.userName.sendKeys(userName),
    fdxLogin.login.password.click(),
    fdxLogin.login.password.sendKeys(password),
    fdxLogin.login.loginButton.click(),
    browser.wait(protractor.ExpectedConditions.presenceOf(fdxLogin.addressBook.sender), 10000)
  ]);
});

Given('I logout', { timeout: 60 * 1000 }, async () => {
  await elementHelper.waitForElement(fdxLogin.login.loginLink);
  await fdxLogin.login.loginLink.click();
  await elementHelper.waitForElement(fdxLogin.logout.submenu);
  await fdxLogin.logout.signout.click();
  await elementHelper.waitForElementRemoval(fdxLogin.logout.submenu);
  await elementHelper.waitForElementEnabled(fdxLogin.login.loginLink);
});

// tslint:disable-next-line:max-line-length
Given('I enter sender as {string} and select {string} from autocompletelist in {string}', { timeout: 60 * 1000 }, async (sender, option, validate) => {
  await elementHelper.waitForElement(fdxLogin.addressBook.sender);
  await fdxLogin.addressBook.sender.click();
  await fdxLogin.addressBook.sender.clear();
  await fdxLogin.addressBook.sender.sendKeys(sender);
  await elementHelper.waitForElement(fdxLogin.addressBook.selectFromAutoCompleteList(option));
  await fdxLogin.addressBook.selectFromAutoCompleteList(option).click();
  await browser.wait(ExpectedConditions.textToBePresentInElementValue(fdxLogin.addressBook.sender, option), 10 * 1000);
  await chai.expect(fdxLogin.addressBook.sender.getAttribute('value')).to.eventually.contain(option);
  await browser.wait(ExpectedConditions.textToBePresentInElementValue(fdxMagr.sendFrom, validate), 10 * 1000);
  await chai.expect(fdxMagr.sendFrom.getAttribute('value')).to.eventually.contain(validate);
});

// tslint:disable-next-line:max-line-length
Given('I enter recipient as {string} and select {string} from autocompletelist in {string}', { timeout: 60 * 1000 }, async (recipient, option, validate) => {
  await elementHelper.waitForElement(fdxLogin.addressBook.recipient);
  await fdxLogin.addressBook.recipient.click();
  await fdxLogin.addressBook.recipient.clear();
  await fdxLogin.addressBook.recipient.sendKeys(recipient);
  await elementHelper.waitForElement(fdxLogin.addressBook.selectFromAutoCompleteList(option));
  await fdxLogin.addressBook.selectFromAutoCompleteList(option).click();
  await browser.wait(ExpectedConditions.textToBePresentInElementValue(fdxMagr.sendTo, validate), 10 * 1000);
  await chai.expect(fdxMagr.sendTo.getAttribute('value')).to.eventually.contain(validate);
});

When('{string} equals {string} I change my locale to {string}', { timeout: 60 * 1000 }, async (status, status2, locale) => {
     if ( status === status2 ) {
       await browser.manage().addCookie({ name: 'fdx_locale', value: locale });
       await browser.refresh();
       await browser.sleep(2000);
     } else {
   // skip iteration and continue with next
    }
});

Then('I assert page title is not 404', { timeout: 60 * 1000 }, async () => {
  await elementHelper.waitForElement(fdxMagr.applicationTitle);
  chai.expect(await browser.getTitle()).to.not.contains('FedEx Page Not Found');
});


Then('the heading of the rating tool contains {string}', { timeout: 60 * 1000 }, async (title) => {
  await elementHelper.waitForElement(fdxMagr.applicationTitle);
  await chai.expect(fdxMagr.applicationTitle.getText()).to.eventually.contain(title);
});

Then('I notice that sender and receiver fields are not present', { timeout: 60 * 1000 }, async () => {
  await chai.expect(fdxLogin.addressBook.sender.isPresent()).eventually.to.be.false;
  await chai.expect(fdxLogin.addressBook.recipient.isPresent()).eventually.to.be.false;
});

Then('application is translated based on translation {string}', async (fileName) => {
  const localeData = require(`../../../../src/assets/translations/${fileName}`);
  await elementHelper.waitForElement(fdxMagr.applicationTitle);
  await chai.expect(fdxMagr.applicationTitle.getText()).to.eventually.equal(localeData.rating.header);
});

