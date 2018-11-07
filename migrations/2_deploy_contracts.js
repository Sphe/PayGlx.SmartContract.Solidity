const PublicStorage = artifacts.require('PublicStorage')
const BasicTokenLib = artifacts.require('BasicTokenLib')
const StandardTokenLib = artifacts.require('StandardTokenLib')
const WhitelistingTokenLib = artifacts.require('WhitelistingTokenLib')
const OwnableLib = artifacts.require('OwnableLib')

const PausableTokenDelegate = artifacts.require('PausableTokenDelegate')
const GlobCoinToken = artifacts.require('GlobCoinToken')

module.exports = function(deployer) {

  deployer.then(async () => {
    await deployer.deploy(PublicStorage)
    await deployer.deploy(BasicTokenLib)
    await deployer.deploy(StandardTokenLib)
    await deployer.deploy(WhitelistingTokenLib)
    await deployer.deploy(OwnableLib)

    PausableTokenDelegate.link('OwnableLib', OwnableLib.address);
    PausableTokenDelegate.link('BasicTokenLib', BasicTokenLib.address);
    PausableTokenDelegate.link('StandardTokenLib', StandardTokenLib.address);
    PausableTokenDelegate.link('WhitelistingTokenLib', WhitelistingTokenLib.address);

    await deployer.deploy(PausableTokenDelegate)

    GlobCoinToken.link('OwnableLib', OwnableLib.address);
    GlobCoinToken.link('BasicTokenLib', BasicTokenLib.address);
    GlobCoinToken.link('StandardTokenLib', StandardTokenLib.address);
    GlobCoinToken.link('WhitelistingTokenLib', WhitelistingTokenLib.address);

    await deployer.deploy(GlobCoinToken, PublicStorage.address)

    let pausableTokenDelegate = await PausableTokenDelegate.deployed()
    let glx = await GlobCoinToken.deployed()

  })

};
