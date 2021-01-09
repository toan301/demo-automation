import { $, by, element, browser } from 'protractor';
const fs = require('fs');
function getMAGRWidget() {
  return $('magr-root');
}

export default {
  applicationTitle: element(by.tagName('h1')),
  get sendFrom() {
    return getMAGRWidget().element(by.id('fromGoogleAddress'));
  },
  get sendFromAfterSelection() {
    return element(by.id('e2efromCountryList'));
  },
  get sendTo() {
    return getMAGRWidget().element(by.id('toGoogleAddress'));
  },
  get sendToAfterSelection() {
    return element(by.id('e2etoCountryList'));
  },
  selectAddress(address) {
    return getMAGRWidget().element(by.cssContainingText('magr-autocomplete-suggestions-google li', `${address}`));
  },
  get googleOptions() {
    return getMAGRWidget().element(by.css('magr-autocomplete-suggestions-google'));
  },
  get postGeoMessage() {
    return getMAGRWidget().element(by.css('#e2eFromAddressPostalReverseGeoMessage'));
  },
  loader: {
    // wait for page loader to load and remove
    waitForPageLoader: element(by.css('fdx-loading-indicator-spinner [class="fdx-c-loading-indicator"]')),
    waitForAddressLoader: element(by.css('magr-package-container fdx-loading-indicator')), // wait for address loader
    waitForList: element(by.css('.magr-google-powered')),
    appLoad: element(by.css('.app-loading')),
    waitForPackageForm: element(by.css('magr-imps-form')),
    geoFromlocation: element(by.css('#e2eFromAddressPostalReverseGeoMessage')),
    geoTolocation: element(by.css('#e2eToAddressPostalReverseGeoMessage')),
  },
  get loadingList() {
    return element.all(by.css('li[data-autocomplete-item="true"]'));
  },
  appBarComponent: {
    appbar: element(by.css('fdx-app-bar .fdx-c-navbar__main')),
    selectAccount(account) {
      return element(by.cssContainingText('[role="menuitem"]+ul li>button', `${account}`));
    },
    menuItem: element.all(by.css('[role="menuitem"]')),
    menuItemElement(itemName) {
      return element(by.cssContainingText('a[class="fdx-c-navbar__menu__item__button"]', `${itemName}`));
    },
    ltlLink: element(by.css('#e2e-ltlFreightLink')),
    chevronIcons(menuItem) {
      return element(by.cssContainingText('li .fdx-c-navbar__menu__item__button--icon-after', `${menuItem}`));
    },
    kebabIcon: element(by.css('li button[aria-label="appBar.openMenu"]')),
  },
  waitForResponse(time) {
    return browser.sleep(time);
  },
  signupnotifications: {
    anonymousLoginMsg: element(by.css('#e2eAnonymousLoginMsg')),
    accountImportMsg: element(by.css('#e2eAccountImportMsg'))
  },
    // abstract writing screen shot to a file
  writeScreenShot(data, filename) {
        const stream = fs.createWriteStream(filename);
        stream.write(new Buffer(data, 'base64'));
        stream.end();
    },
  get shipDate() {
    return element(by.css('#packageShipDate'));
  },
  get shipButton() {
    return element(by.css('magr-rate .magr-c-rates__button'));
  },
  selectShipDate() {
    return element.all(by.css('#packageShipDate option'));
  },
  errorModal: {
    window: element(by.css('magr-error magr-modal')),
    close: element(by.css('magr-modal .fdx-c-icon')),
  },
  get liabilityInfoButton() {
    return element(by.css('.fdx-c-tooltip__button'));
  },
  get liabilityTooltipContent() {
    return element(by.css('[role="tooltip"]'));
  },
  get fedexServiceGuideLink() {
    return element(by.xpath('//a[text()="FedEx Service Guide"]'));
  }
};
