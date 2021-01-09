import { $, by, element } from 'protractor';
function getMAGRWidget() {
  return $('magr-root');
}

export default {
  get packaging() {
    return getMAGRWidget().element(by.css('#package-details__package-type'));
  },
  selectPackageType(packageType) {
    return getMAGRWidget().element(by.css(`#package-details__package-type option[value="${packageType.trim().replace(/ /g, '_').toUpperCase()}"]`));
  },
  get allPackageTypeOptions() {
    return getMAGRWidget().all(by.css('#package-details__package-type option'));
  },
  get NoOfPackages() {
    return getMAGRWidget().element(by.css('#package-details__quantity-0'));
  },
  selectNoOfPackages(packages) {
    return element.all(by.css(`#package-details__quantity-0 option`)).get(parseInt(packages, 0) - 1);
  },
  get multipackageArea() {
    return getMAGRWidget().element(by.css(`.fdx-c-definitionlist__description`));
  },
  get packageWeight() {
    return getMAGRWidget().element(by.css('#package-details__weight-0'));
  },
  get packageWeightUnit() {
    return getMAGRWidget().element(by.css('[for="package-details__weight-0"]+span[class="fdx-c-form-group__suffix"]'));
  },
  get carriageValue() {
    return getMAGRWidget().element(by.css('#package-details__value-0'));
  },
  get carriageValueCurrency() {
    return element(by.id(`package-details__currency`));
  },
  get carriageValueUnit() {
    return getMAGRWidget().element(by.css('[for="package-details__value-0"]+span[class="fdx-c-form-group__suffix"]'));
  },
  get SimpleShipping() {
    return element(by.css('#welcomePageSimpleShippingButton'));
  },
  get appBar() {
    return element(by.css('.fxg-app-bar'));
  },
  get country() {
    return element(by.css('[name="TO"] #addressDetailsComponent [name="country"]'));
  },
  get name() {
    return element(by.css('#userNameTO'));
  },
  get phone() {
    return element(by.css('[name="TO"] [name="phoneNumber"]'));
  },
  get Rate() {
    return element(by.css('[aria-label="Get Rate and Shipping Details"]'));
  },
  get fromAddress() {
    return element(by.css('[name="TO"] [name="address"]'));
  },
  get liabilityCoverage() {
    return element(by.css('[for="package-details__liability-coverage-yes"]'));
  },
  get noLiabilityCoverage() {
    return element(by.css('[for="package-details__liability-coverage-no"]'));
  },
  get packageDimensions() {
    return element(by.tagName('magr-package-dimensions'));
  },
  get packageWeightMessages() {
    return element(by.id('package-details__weight-error'));
  },
  get packageCarriageValueMessages() {
    return element(by.id('package-details__value-error'));
  },
  selectWeightUnit(unit) {
    return getMAGRWidget().element(by.css(`#package-details__unit option[value*="${(unit.toString().toLowerCase() === 'kg') ? 'METRIC' : 'IMPERIAL'}"`));
  },
  selectCountry(country) {
    return element(by.cssContainingText('[name="TO"] #addressDetailsComponent [name="country"] option', `${country}`));
  },
  selectAddress(address) {
    return element(by.cssContainingText('.pac-container .pac-item-query', `${address}`));
  },
  carriageValueCurrencyOption(currency) {
    return element(by.cssContainingText('#package-details__currency option', `${currency}`));
  },
  newCarriageValue(lineNumber) {
    return getMAGRWidget().element(by.css('#package-details__value-' + lineNumber));
  },
  newCarriageWeight(lineNumber) {
    return getMAGRWidget().element(by.css('#package-details__weight-' + lineNumber));
  },
  get packageSection() {
    return getMAGRWidget().element(by.tagName('magr-package-details'));
  },
  get totalPackage() {
    return element.all(by.css('magr-package-totals .fdx-c-definitionlist__description')).get(0);
  },
  get totalWeight() {
    return element.all(by.css('magr-package-totals .fdx-c-definitionlist__description')).get(1);
  },
  get recommendedWeight() {
    return element(by.css('[for="package-details__weight-0"] span'));
  }
};
