const PublicStorage = artifacts.require('PublicStorage')
const BasicTokenLib = artifacts.require('BasicTokenLib')
const StandardTokenLib = artifacts.require('StandardTokenLib')
const WhitelistingTokenLib = artifacts.require('WhitelistingTokenLib')
const OwnableLib = artifacts.require('OwnableLib')

const PausableTokenDelegate = artifacts.require('PausableTokenDelegate')
const GlobCoinToken = artifacts.require('GlobCoinToken')

module.exports = function(deployer) {

  var publicStorage = deployer.deploy(PublicStorage);
  var basicTokenLib = deployer.deploy(BasicTokenLib);
  var standardTokenLib = deployer.deploy(StandardTokenLib);
  var whitelistingTokenLib = deployer.deploy(WhitelistingTokenLib);
  var ownableLib = deployer.deploy(OwnableLib);

  PausableTokenDelegate.link('OwnableLib', ownableLib.address);
  PausableTokenDelegate.link('BasicTokenLib', basicTokenLib.address);
  PausableTokenDelegate.link('StandardTokenLib', standardTokenLib.address);
  PausableTokenDelegate.link('WhitelistingTokenLib', whitelistingTokenLib.address);

  var pausableTokenDelegate = deployer.deploy(PausableTokenDelegate);

  GlobCoinToken.link('OwnableLib', ownableLib.address);
  GlobCoinToken.link('BasicTokenLib', basicTokenLib.address);
  GlobCoinToken.link('StandardTokenLib', standardTokenLib.address);
  GlobCoinToken.link('WhitelistingTokenLib', whitelistingTokenLib.address);

  var glx = deployer.deploy(GlobCoinToken, publicStorage);

  glx.upgradeTo(pausableTokenDelegate.address);

};

