import { by, element } from 'protractor';

export default {
  label: element(by.css('#signatureOptionsLabel')),
  checkbox: element(by.css('#signatureOptions')),
  tooltip: element(by.css('magr-signature-options .fdx-c-tooltip__button')),
  selectedOption: element(by.css('magr-signature-options input[type="radio"]:checked')),
  signatureType(type) {
    return element(by.css(`label[for="option${type}"]`));
  }
};
