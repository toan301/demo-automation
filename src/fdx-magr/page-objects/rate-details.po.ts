import { $, by, element } from 'protractor';
function getMAGRWidget() {
  return $('magr-root');
}

import signatureOptionsPO from './rate-details-signature.po';
import pickupOptionsPO from './rate-details-pickup.po';
import pricesPO from './rate-details-prices.po';

export default {
  signatureOptions: signatureOptionsPO,
  pickupOtions: pickupOptionsPO,
  prices: pricesPO,
  get ratebtn() {
    return getMAGRWidget().element(by.css('#e2ePackageDetailsSubmitButtonRates'));
  },
  get transitbtn() {
    return getMAGRWidget().element(by.css('#e2ePackageDetailsSubmitButtonTransitTimes'));
  },
  rateSection: {
    title: element(by.css('magr-rate-container h4')),
    ratelist: element(by.css('magr-rate-list')),
    deliveryDates: element.all(by.css('magr-rate section')),
    deliveryServices: element.all(by.css('magr-rate section ul li')),
    ratePriceCurrencyMessage(text) {
      return element(by.cssContainingText('magr-rate-list p', text));
    },
    quotes: element.all(by.css('li .magr-c-rates__button')),
    ammountShown: element(by.css('[data-e2e-id="amounts-shown"]')),
    rateType: {
      get retailRates() {
        return getMAGRWidget().element(by.id('fedexStandardRates-label'));
      },
      get fedexOne() {
        return getMAGRWidget().element(by.id('fedexOneRates-label'));
      },
      get activeTabButton() {
        return getMAGRWidget().element(by.css('magr-rate-type input[type="radio"]:checked'));
      }
    },
    package: {
      weight: element(by.css('magr-one-rate-weight #packageWeight'))
    },
    retailRates: {
      showRates: element(by.partialButtonText('Show Rates'))
    }
  },
  pleaseNotes: element(by.css('[data-e2e-id="please-notes"]')),
  advanceRating: element(by.css('.rating_link')),
  rateSummary: element(by.id('rateSummary'))
};
