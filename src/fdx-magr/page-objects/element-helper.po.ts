import { browser, protractor, WebElement } from 'protractor';

export default {
  waitForElement(elm, timeout?: number) {
    const wait = timeout || 25 * 1000;
    return browser.wait(protractor.ExpectedConditions.presenceOf(elm), wait)
      .then(() => browser.wait(protractor.ExpectedConditions.visibilityOf(elm), wait))
      .catch(err => {
        throw new Error(err);
      });
  },
  scrollElementIntoView(selector) {
    return browser.executeScript((el) => {
      el.scrollIntoView();
    }, selector);
  },
  waitForElementRemoval(elm, timeout?: number) {
    const wait = timeout || 25 * 1000;
    return browser.wait(protractor.ExpectedConditions.stalenessOf(elm), wait)
      .catch(err => {
        throw new Error(err);
      });
  },
  waitForElementEnabled(elm, timeout?: number) {
    const wait = timeout || 25 * 1000;
    return browser.wait(protractor.ExpectedConditions.elementToBeClickable(elm), wait)
      .catch(err => {
        throw new Error(err);
      });
  },
  async setValue(elm: WebElement, inputText: string) {
    await elm.clear();
    await elm.sendKeys(inputText);
  },
  async selectAValue(elm , value: string) {
    await this.waitForElement(elm);
    await elm.$(`[value=${value}]`).click();
  },
  async waitAndClick(elm: WebElement) {
    await this.waitForElement(elm);
    await elm.click();
    },
};
