export default {
  addresses: {
    sender: {
      utr: 'Utrecht, Netherlands',
      maar: 'Maarn, Netherlands',
      amsterdam: 'Amsterdam Centraal',
      ams: 'Amsterdam Centraal, Stationsplein, Amsterdam, Netherlands'
    },
    senderCountry: {
      Netherlands: 'locale=nl_nl'
    },
    receiver: {
      Utrecht: 'Utrechtsestraat, Amsterdam, Netherlands',
      amsterdam: 'Amsterdam-Zuidoost, Amsterdam, Netherlands'
    }
  },
  users: {
    fedex: {
      MAGICJAPAN: {
        username: 'MAGICJP',
        password: 'Test1234'
      },
      MAGICUSRR: {
        username: 'L6USRR',
        password: 'Test1234'
      },
      UKENABLEDUSER: {
        username: 'L6AlphaTest2',
        password: 'Test1234'
      },
      RegularUser: {
        username: 'L6STDUS1',
        password: 'Test1234'
      },
      DeptAdminUser: {
        username: 'L6GRPRRJUN',
        password: 'Test1234'
      },
      Magsadmin: {
        username: 'MAGSADMIN',
        password: 'Test1234'
      }
    }
  },
  testlevel: {
    fedex: {
      env: {
       L6: 'https://wwwtest.fedex.com/en-jp/online/rating.html',
       L3: 'https://wwwdrt.idev.fedex.com/apps/shipping-rates',
       L7: 'https://wwwtest.fedex.com/en-au/online/shipping.html#/'
      }
    }
  }
};
