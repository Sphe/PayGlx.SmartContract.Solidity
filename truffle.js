require('babel-register')
require('babel-polyfill')

var mne1 = 'dove apology alert strike achieve human enhance common raven tone kite voice';
var HDWalletProvider = require('truffle-hdwallet-provider')

module.exports = {
  networks: {
    coverage: {
      host: 'localhost',
      network_id: '*',
      port: 8546,
      gas: 13443950,
      gasPrice: 20000000000
    },

    development: {
      host: '127.0.0.1',
      port: 8545,
      network_id: 1234 // Match any network id
    },
 
    ropsten: {

      provider: new HDWalletProvider(mne1, 'https://ropsten.infura.io/4d580aedabbe4e79979bbbd7c51ebb83'),
      network_id: "3",
      gas: 7990000,
      gasPrice: 2000000000

    },
    rinkeby: {

      provider: new HDWalletProvider(mne1, 'https://rinkeby.infura.io/v3/4d580aedabbe4e79979bbbd7c51ebb83'),
      network_id: "4",
      gas: 7990000,
      gasPrice: 22000000000

    }


  }
}
