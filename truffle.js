require('babel-register');
require('babel-polyfill');

var HDWalletProvider = require("truffle-hdwallet-provider");

module.exports = {
  solc: {
    optimize: false,
    runs: 2000000000
  },
  networks: {
    development: {
      host: "46.105.121.205",
      port: 18545,
      gas: 10000000,
      gasPrice: 50000000000, // Specified in Wei
      network_id: "*" // Match any network id
    }
  }
};
