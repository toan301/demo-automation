import { Given } from 'cucumber';
import { browser, protractor, $ } from 'protractor';
import testData from '../../../data/e2e-test-data';
import * as chai from 'chai';
import * as chaiAsPromised from 'chai-as-promised';
import fdxMagr from '../../page-objects/fdx-magr.po';
import fdxLogin from '../../page-objects/login-details.po';
import elementHelper from '../../page-objects/element-helper.po';
import { currentEnvName } from '../../../data/env-config';
import fdxAddressEntry from '../../page-objects/address.po';

chai.use(chaiAsPromised);

// This step takes you to local page where user can login with any test env credetials and then redirects to MAGR app aith App-bar
Given('As a {string} user I login locally using one of the tests env', { timeout: 60 * 1000 }, async (userDetails) => {
  const userName = testData.users.fedex[userDetails].username;
  const password = testData.users.fedex[userDetails].password;
  const appUrl = await browser.getCurrentUrl().then((text) => text);
  await browser.get('file:///' + __dirname + '/index.html');
  await elementHelper.waitForElement(fdxLogin.localLogin.magicLogin);
  await fdxLogin.localLogin.magicEnv.click();
  await fdxLogin.localLogin.selectMagicEnv(currentEnvName).click();
  // await fdxLogin.localLogin.magicMockedChkBox.click();
  await elementHelper.setValue(fdxLogin.localLogin.magicUsername, userName);
  await elementHelper.setValue(fdxLogin.localLogin.magicPassword, password);
  await fdxLogin.localLogin.magicLogin.click();
  await elementHelper.waitForElement(fdxLogin.localLogin.magicSucess);
  const loginCookie = await fdxLogin.localLogin.magicCookie.getAttribute('value').then((text) => text);
  console.log(loginCookie);
  if (appUrl.indexOf(`?force-rating-advanced-view`) !== -1) {
    await browser.navigate().to(`${browser.baseUrl}${browser.params.fullUrl}`);
  } else {
    await browser.navigate().to(browser.baseUrl);
  }
  await browser.manage().deleteAllCookies();
  await browser.manage().addCookie({ name: 'fdx_login', value: loginCookie , domain: 'localhost' });
  await browser.refresh();
  await elementHelper.waitForElementRemoval(fdxMagr.loader.waitForPageLoader);
  await browser.sleep(1000); // Allow translations to load
  await elementHelper.waitForElement(fdxAddressEntry.getcovidNotificationTitle(), 5000).then(() => {
    fdxAddressEntry.getcovidNotificationTitle().isDisplayed().then($result => {
      if ($result) {
        fdxAddressEntry.getcovidNotificationCloseButton().click();
      }
    });
 }).catch(() => { });
});

Given('As a {string} user I login using cookie from L6 env', { timeout: 60 * 1000 }, async (userDetails) => {
  const userName = testData.users.fedex[userDetails].username;
  const password = testData.users.fedex[userDetails].password;
  const appUrl = await browser.getCurrentUrl().then((text) => text);
  await browser.get('https://wwwtest.fedex.com/en-jp/online/rating.html');
  await browser.wait(protractor.ExpectedConditions.elementToBeClickable(fdxLogin.remoteLogin.loginButton));
  await fdxLogin.remoteLogin.loginButton.click();
  await fdxMagr.waitForResponse(1000);
  await fdxLogin.remoteLogin.loginUserName.sendKeys(userName);
  await fdxLogin.remoteLogin.loginPassword.sendKeys(password);
  await fdxLogin.remoteLogin.loginSubmitButton.click();
  await browser.wait(protractor.ExpectedConditions.visibilityOf($('[id="senderName"]')));
  const loginCookie = await browser.manage().getCookie('fdx_login');
  if (appUrl.indexOf(`?force-rating-advanced-view`) !== -1) {
    await browser.navigate().to(`${browser.baseUrl}${browser.params.fullUrl}`);
  } else {
    await browser.navigate().to(browser.baseUrl);
  }
  await browser.manage().deleteAllCookies();
  await browser.manage().addCookie(loginCookie);
  await elementHelper.waitForElementRemoval(fdxMagr.loader.waitForPageLoader);
  await browser.sleep(1000); // Allow translations to load
  await elementHelper.waitForElement(fdxAddressEntry.getcovidNotificationTitle(), 5000).then(() => {
    fdxAddressEntry.getcovidNotificationTitle().isDisplayed().then($result => {
      if ($result) {
        fdxAddressEntry.getcovidNotificationCloseButton().click();
      }
    });
 }).catch(() => { });
});

Given('As a {string} user I login to MAGR full', { timeout: 60 * 1000 }, async (userDetails) => {
  const userName = testData.users.fedex[userDetails].username;
  const password = testData.users.fedex[userDetails].password;
  const appUrl = await browser.getCurrentUrl().then((text) => text);
  await browser.get(`${browser.baseUrl}${browser.params.fullUrl}${browser.params.loginHeader}`);
  await browser.wait(protractor.ExpectedConditions.elementToBeClickable(fdxLogin.remoteLogin.loginButton));
  await fdxLogin.remoteLogin.loginButton.click();
  await fdxMagr.waitForResponse(1000);
  await fdxLogin.remoteLogin.loginUserName.sendKeys(userName);
  await fdxLogin.remoteLogin.loginPassword.sendKeys(password);
  await fdxLogin.remoteLogin.loginSubmitButton.click();
  await browser.wait(protractor.ExpectedConditions.visibilityOf($('[id="senderName"]')));
  if (appUrl.indexOf(`?force-rating-advanced-view`) !== -1) {
    await browser.navigate().to(`${browser.baseUrl}${browser.params.fullUrl}`);
  } else {
    await browser.navigate().to(browser.baseUrl);
  }
});




