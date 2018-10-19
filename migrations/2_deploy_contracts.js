const PublicStorage = artifacts.require('PublicStorage')
const BasicTokenLib = artifacts.require('BasicTokenLib')
const StandardTokenLib = artifacts.require('StandardTokenLib')
const WhitelistingTokenLib = artifacts.require('WhitelistingTokenLib')
const OwnableLib = artifacts.require('OwnableLib')
const PausableTokenDelegate = artifacts.require('PausableTokenDelegate')
const GlobCoinToken = artifacts.require('GlobCoinToken')
const GlobCoinOwnableToken = artifacts.require('GlobCoinOwnableToken')

module.exports = function(deployer) {

  deployer.deploy(PublicStorage);
  deployer.deploy(BasicTokenLib);
  deployer.deploy(StandardTokenLib);
  deployer.deploy(WhitelistingTokenLib);
  deployer.deploy(OwnableLib);
  deployer.deploy(PausableTokenDelegate);
  deployer.deploy(GlobCoinToken);
  deployer.deploy(GlobCoinOwnableToken);

};

