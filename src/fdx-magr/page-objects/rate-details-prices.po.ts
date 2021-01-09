import { by, element } from 'protractor';

export default {
  rate: element(by.tagName('magr-rate')),
  togglePriceBreakdown(rate) {
    return element.all(by.css(`magr-rate li #toggle-0`)).get(rate - 1);
  },
  priceBreakdownComponents: element.all(by.css('dl[data-e2e-id="rate-price-breakdown"] dt')),
  priceBreakdownComponentsPrices: element.all(by.css('dl[data-e2e-id="rate-price-breakdown"] dd'))
};
