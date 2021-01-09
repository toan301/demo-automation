// Protractor configuration file, see link for more information
// https://github.com/angular/protractor/blob/master/lib/config.ts
const os = require('os');
const platform = os.platform();
const appName = 'fdx-magr';
const port = '4200';

exports.config = {
  chromeDriver: '../node_modules/chromedriver/bin/chromedriver', // fixate chromedriver version so Jenkins doesn't puke
  debug: false,
  getPageTimeout: 30000,
  allScriptsTimeout: 60000,
  defaultTimeoutInterval: 30000,
  specs: [
    `./src/${appName}/regression/**/*.feature`
  ],
  SELENIUM_PROMISE_MANAGER: false,
  capabilities: {
    'browserName': 'chrome',
	'chromeOptions': {
    'args': [ '--window-size=1000,1400', '--disable-dev-shm-usage', '--incognito', '--verbose', '--disable-web-security'],
      useAutomationExtension: false
    },
    shardTestFiles: true,
    maxInstances: process.env.MAX_E2E_INSTANCES || 1,
    metadata: {
      device: 'Desktop',
      platform: {
        name: platform === 'darwin' ? 'osx' : platform
      }
    }
  },
  directConnect: true,
  baseUrl: `https://localhost:${port}/`,
  framework: 'custom',
  frameworkPath: require.resolve('protractor-cucumber-framework'),
  cucumberOpts: {
    strict: true,
    require: [
      `src/${appName}/**/*.ts`,
      `src/support/*.ts`
    ],
    format: [
      `json:test-reports/smoketest/json/cucumber-test-results.json`
    ],
    tags: [ "~@fail" ]
  },
  plugins: [{
    package: require.resolve('protractor-multiple-cucumber-html-reporter-plugin'),
    options: {
      automaticallyGenerateReport: true,
      removeExistingJsonReportFile: true,
      reportPath: `test-reports/smoketest/html`
    }
  }],
  onPrepare() {
    require('ts-node').register({
      project: require('path').join(__dirname, './tsconfig.smoketest.json')
    });
  },
  params: {
    fullUrl:`?force-rating-advanced-view`,
    loginHeader: `&force-features=CaaS`,
    forceScreenshots: false,
  },
};
