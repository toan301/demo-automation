import { by, element, $ } from 'protractor';

export default {
  login: {
    loginLink: element(by.css('[data-default-signintext="Sign Up or Log In"]')),
    userName: element(by.css('[name="user"]')),
    password: element(by.css('[name="pwd"]')),
    loginButton: element(by.css('button[class*="fdx-login"]'))
  },
  logout: {
    submenu: element(by.css('.fxg-user-options .fxg-dropdown__sub-menu ')),
    signout: element(by.css('a[title="SIGN OUT"]'))
  },
  localLogin: {
    magicEnv: element(by.css('#environment')),
    selectMagicEnv(env) {
      return element(by.css(`#environment option[value=${env}]`));
      },
    magicUsername: element(by.css('#userName')),
    magicPassword: element(by.css('#password')),
    magicLogin: element(by.css('#submitButton')),
    magicSucess: element(by.css('#done')),
    magicCookie: element(by.id('cookie')),
    magicMockedChkBox: element(by.id('mocked')),
  },
  remoteLogin: {
    loginButton: $('.fxg-user-options__sign-in-text'),
    loginUserName: $('#NavLoginUserId'),
    loginPassword: $('#NavLoginPassword'),
    loginSubmitButton: $('#HeaderLogin button[type="submit"]')
  },
  addressBook: {
    sender: element(by.css('#senderName')),
    recipient: element(by.css('#recipientName')),
    selectFromAutoCompleteList(option) {
      return element(by.cssContainingText('magr-autocomplete-suggestions [role="option"]', `${option}`));
      }
  },
};
