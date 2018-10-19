const PublicStorage = artifacts.require('PublicStorage')
const BasicTokenLib = artifacts.require('BasicTokenLib')
const StandardTokenLib = artifacts.require('StandardTokenLib')
const WhitelistingTokenLib = artifacts.require('WhitelistingTokenLib')
const OwnableLib = artifacts.require('OwnableLib')



const PausableTokenDelegate = artifacts.require('PausableTokenDelegate')
const GlobCoinToken = artifacts.require('GlobCoinToken')
const GlobCoinOwnableToken = artifacts.require('GlobCoinOwnableToken')

module.exports = function(deployer) {

  //var publicStorage = deployer.deploy(PublicStorage);
  //var basicTokenLib = deployer.deploy(BasicTokenLib);
  //var standardTokenLib = deployer.deploy(StandardTokenLib);
  //var whitelistingTokenLib = deployer.deploy(WhitelistingTokenLib);
  //var ownableLib = deployer.deploy(OwnableLib);

  var publicStorage = PublicStorage.at("0x6c06afbc89fe206db9323005606c75b86c05768c");
  var basicTokenLib = BasicTokenLib.at("0xc700b754cb2f774fae5cb576fdc3f87cabb92e9d");
  var standardTokenLib = StandardTokenLib.at("0x26e19b2792457c6c7ecaf8cb32a43a7dba7a73ae");
  var whitelistingTokenLib = WhitelistingTokenLib.at("0x7e5f4500bd286f13793b1cbab283c8729d86297f");
  var ownableLib = OwnableLib.at("0x6ca8eb0843c132e3381c2250bb6fd05876a36169");

  PausableTokenDelegate.link('BasicTokenLib', basicTokenLib.address);
  PausableTokenDelegate.link('StandardTokenLib', standardTokenLib.address);
  PausableTokenDelegate.link('WhitelistingTokenLib', whitelistingTokenLib.address);

  deployer.deploy(PausableTokenDelegate);

  GlobCoinToken.link('OwnableLib', ownableLib.address);
  GlobCoinToken.link('BasicTokenLib', basicTokenLib.address);
  GlobCoinToken.link('StandardTokenLib', standardTokenLib.address);
  GlobCoinToken.link('WhitelistingTokenLib', whitelistingTokenLib.address);

  deployer.deploy(GlobCoinToken);

  GlobCoinOwnableToken.link('OwnableLib', ownableLib.address);
  GlobCoinOwnableToken.link('BasicTokenLib', basicTokenLib.address);
  GlobCoinOwnableToken.link('StandardTokenLib', standardTokenLib.address);
  GlobCoinOwnableToken.link('WhitelistingTokenLib', whitelistingTokenLib.address);

  deployer.deploy(GlobCoinOwnableToken);

};

