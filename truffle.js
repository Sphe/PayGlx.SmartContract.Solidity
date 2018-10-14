// Allows us to use ES6 in our migrations and tests.
require('@babel/register')
require('@babel/polyfill')

var HDWalletProvider = require('truffle-hdwallet-provider')

var mnemonic = 'dove apology alert strike achieve human enhance common raven tone kite voice'

module.exports = {
  networks: {
    ropsten: {
      provider: new HDWalletProvider(mnemonic, 'http://46.105.121.205:9566'),
      network_id: 3,
      gas: 4612388,
      gasPrice: 100000000000
    },
    development: {
      host: '127.0.0.1',
      port: 8545,
      network_id: 1234 // Match any network id
    }
  }
}
