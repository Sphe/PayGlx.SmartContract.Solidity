var HDWalletProvider = require('truffle-hdwallet-provider')

var mnemonic = 'dove apology alert strike achieve human enhance common raven tone kite voice'
var publicNode = 'http://localhost:9566'

module.exports = {
  solc: {
    optimizer: {
      enabled: true,
      runs: 2000000000
    }
  },
  networks: {
    ropsten: {
      provider: () =>
        new HDWalletProvider(mnemonic, publicNode),
      host: "localhost",
      port: 9566,
      network_id: "3",
      gas: 7990000,
      gasPrice: 22000000000 // Specified in Wei
    }
  }
}
