import { $, by, element } from 'protractor';
function getMAGRWidget() {
  return $('magr-root');
}

export default {
  get packageDetails() {
    return element(by.tagName('magr-package-lines'));
  },
  get length() {
    return getMAGRWidget().element(by.css('#package-details__dimensions-0 input[formcontrolname="length"]'));
  },
  get width() {
    return getMAGRWidget().element(by.css('#package-details__dimensions-0 input[formcontrolname="width"]'));
  },
  get height() {
    return getMAGRWidget().element(by.css('#package-details__dimensions-0 input[formcontrolname="height"]'));
  },
  get weight() {
    return getMAGRWidget().element(by.css('#package-details__weight-0'));
  },
  get dimensionUnit() {
    return getMAGRWidget().element(by.css('[for="package-details__dimensions-0"]+span[class="fdx-c-form-group__suffix"]'));
  },
  setValues(values) {
    return Object.keys(values).forEach((property) => this[property].sendKeys(`${values[property]}`));
  },
};
