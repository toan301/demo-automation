const config = {
   testlevel: {
    fedex: {
      env: {
       L6: 'https://wwwtest.fedex.com/en-jp/online/rating.html',
       L3: 'https://wwwdrt.idev.fedex.com/apps/shipping-rates',
       L6APPLite: 'https://wwwtest.fedex.com/magr/app/index.html',
       L3APPLite: 'https://wwwdrt.idev.fedex.com/magr/app/index.html',
       L6APP: 'https://wwwtest.fedex.com/magr/app/index.html?force-rating-advanced-view',
       L3APP: 'https://wwwdrt.idev.fedex.com/magr/app/index.html?force-rating-advanced-view'
      }
    }
  },
  envname: {
    L6: 'L6',
    L3: 'L3',
    L2: 'L2',
    PCF: 'PCF',
    Local: 'Local',
  },
};
export default config;
export const currentEnvLevel = config.testlevel.fedex.env.L6;  // Change here to use one of the test envs defined above for eg. L6-->L3
export const currentEnvName = config.envname.L6;  // Change here to use one of the test envs name defined above for eg. L6-->L3
