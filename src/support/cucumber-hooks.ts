import { browser } from 'protractor';
import { After, Before, setDefaultTimeout } from 'cucumber';
import { inspect } from 'util';

setDefaultTimeout(30 * 1000);
Before(() => {
  browser.manage().deleteAllCookies();
  browser.waitForAngularEnabled(false);
});

// Look for console errors
After({ timeout: 10 * 1000 }, () => {
  browser.executeScript('window.sessionStorage.clear();');
  browser.getCapabilities().then((cap) => {
    const browserName = cap.get('browserName');

    // Reading the browser console logs is only compatible with chrome
    if (browserName === 'chrome') {
      browser.manage().logs().get('browser').then((browserLog) => {
        const log = inspect(browserLog);
        const logHasErrors = log.includes('ERROR');
        // Log to console if an error was found
        if (logHasErrors) {
          console.log(log);
        }
      });
    }
  });
});

// Note: The After hooks are run in reverse order that they are defined in
After({ timeout: 10 * 1000 }, function(testCase) {
  const world = this;
  if (testCase.result.status !== 'passed' || browser.params.forceScreenshots) {
    return browser.takeScreenshot().then((screenShot) => {
      world.attach(screenShot, 'image/png'); // screenShot is a base-64 encoded PNG
    });
  }
});
