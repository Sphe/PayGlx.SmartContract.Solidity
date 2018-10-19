require('babel-register')
require('babel-polyfill')

module.exports = {
  networks: {
    coverage: {
      host: 'localhost',
      network_id: '*',
      port: 8546,
      gas: 0xfffffffffff,
      gasPrice: 0x01
    },

    development: {
      host: '127.0.0.1',
      port: 8545,
      network_id: 1234 // Match any network id
    },


    ropsten: getRopstenConfig()
  }
}

var mne1 = 'dove apology alert strike achieve human enhance common raven tone kite voice';

function getRopstenConfig () {
  var HDWalletProvider = require('truffle-hdwallet-provider')

  var rProvider = () => {
    const provider = new HDWalletProvider(mne1, 'http://46.105.121.205:9566')
    return provider
  }

  return {
    network_id: 3,
    provider: rProvider,
    gas: 8000000,
    gasPrice: 100000000000
  }
}
