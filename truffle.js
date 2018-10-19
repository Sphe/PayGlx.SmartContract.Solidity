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

    ropsten: getRinkebyConfig()
  }
}

var mne1 = 'dove apology alert strike achieve human enhance common raven tone kite voice';

function getRinkebyConfig () {
  var HDWalletProvider = require('truffle-hdwallet-provider')
  var secrets = {}
  try {
    secrets = require('./secrets.json')
  } catch (err) {
    console.log('could not find ./secrets.json')
  }
   var rinkebyProvider = () => {
    const provider = new HDWalletProvider(mne1, 'ropsten.infura.io/v3/4d580aedabbe4e79979bbbd7c51ebb83')
    return provider
  }
   return {
    network_id: 4,
    provider: rinkebyProvider
  }
}

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
