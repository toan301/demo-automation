import { $, by, element } from 'protractor';
function getMAGRWidget() {
  return $('magr-root');
}

export default {
  autocompleteFrom: element.all(by.css('#e2eFromLocation #e2eGoogleAddressSuggestionList li')).first(),
  autocompleteTo: element.all(by.css('#e2eToLocation #e2eGoogleAddressSuggestionList li')).first(),
  getcovidNotificationTitle() {
    return element(by.cssContainingText('#modalTitle', 'COVID-19'));
  },
  getcovidNotificationCloseButton() {
    return element(by.css('magr-modal [icontype="cross"]'));
  },
  selectFromAutoCompleteList(field, option) {
    const container = `#e2e${field.toLowerCase() === 'to' ? 'To' : 'From'}Location`;
    return element(by.cssContainingText(`${container} li[role="option"]`, `${option}`));
  },
  manualAddressInformation(field) {
    return getMAGRWidget().element(by.css(`#${field.toLowerCase()}AddressField`));
  },
  manualEntryLink(field) {
    return getMAGRWidget().element(by.css(`magr-manual-location[ng-reflect-type="${field.toLowerCase()}"]`));
  },
  resetManualAddress(field) {
    return getMAGRWidget().element(by.css(`#e2eNavigateBackTo${field}GoogleAddressInput`));
  },
  resetSenderAddressLink() {
    return getMAGRWidget().element(by.css(`#e2eNavigateBackToSenderGoogleAddressInput`));
  },
  resetRecipientAddressLink() {
    return getMAGRWidget().element(by.css(`#e2eNavigateBackToRecipientGoogleAddressInput`));
  },
  manualCountryList(field) {
    return getMAGRWidget().element(by.css(`#e2e${field.toString().toLowerCase()}CountryList`));
  },
  selectCountry(field, country) {
    return getMAGRWidget().element(by.xpath(`//select[@id='e2e${field}CountryList']/option[text() = ' ${country} ']`));
  },
  manualCityList(field) {
    // right query for original city = #toAddressField [id="field_rating.cityOrigin"]
    // right query for destination city = #fromAddressField [id="field_rating.cityDestination"]
    const cityInput = `[id="field_rating.${field.toLowerCase() === 'from' ? 'cityOrigin' : 'cityDestination'}"]`;
    return getMAGRWidget().element(by.css(cityInput));
    // return getMAGRWidget().element(by.css(`[id="field_rating.city${field}"]`));
    // return getMAGRWidget().element(by.css(`#${field.toLowerCase()}AddressField [id="field_rating.cityOrigin"]`));
  },
  selectCity(field, city) {
    return getMAGRWidget().element(by.cssContainingText(`#${field.toLowerCase()}City li`, `${city}`));
  },
  manualPostCode(field) {
    return getMAGRWidget().element(by.css(`#e2e${field.toLowerCase()}PostalCodeInput`));
  },
  postcodeErrors(field) {
    return getMAGRWidget().element(by.css(`#${field.toLowerCase()}PostalCodeErrors`));
  },
  postcodeError(field) {
    return {
      postError: {
        requiredError : getMAGRWidget().element(by.css(`#e2e${field}ZipCodeRequiredMessage`)),
        minLengthError: getMAGRWidget().element(by.css(`#e2e${field}ZipCodeMinLengthErrorMessage`)),
        invalidError: getMAGRWidget().element(by.css(`#e2e${field}PostalCodeInvalidErrorMessage`))
      },
    };
  },
  manualPostCodeLabel(field) {
    return getMAGRWidget().element(by.css(`label[for="e2e${field.toLowerCase()}PostalCodeInput"]`));
  },
  get resetOriginBtn() {
    return getMAGRWidget().element(by.css('#e2eNavigateBackToSenderGoogleAddressInput'));
  },
  get resetDestinationBtn() {
    return getMAGRWidget().element(by.css('#e2eNavigateBackToRecipientGoogleAddressInput'));
  },
  get manualContinueBtn() {
    return getMAGRWidget().element(by.css('#e2eManualEntryContinue'));
  },
  get domesticShippingNotAllowed() {
    return getMAGRWidget().element(by.css('div[data-e2e-id="e2eDomesticShipmentIsNotAllowedError"]'));
  },
  get intraCountryShippingNotAllowed() {
    return getMAGRWidget().element(by.css('div[data-e2e-id="e2eGenericDomesticShipmentIsNotAllowedError"]'));
  },
  get enterTheAddressYourselfBtn() {
    return element(by.cssContainingText('button', 'Enter the address yourself'));
  },
  warningFedexDoesNotServiceMessage(field) {
    return element(by.css(`#e2e${field}AddressCountryNotServiceableErrorMessage`));
  },
  warningAddressRequiredMessage(field) {
    return element(by.css(`#e2e${field}AddressRequiredErrorMessage`));
  }
};
