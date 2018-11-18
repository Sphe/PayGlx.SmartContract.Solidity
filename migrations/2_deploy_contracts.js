const KeyValueStorage = artifacts.require('KeyValueStorage')
const StorageLib = artifacts.require('StorageLib')
const BasicTokenLib = artifacts.require('BasicTokenLib')
const StandardTokenLib = artifacts.require('StandardTokenLib')
const WhitelistingTokenLib = artifacts.require('WhitelistingTokenLib')

const PausableTokenDelegate = artifacts.require('PausableTokenDelegate')
const GlobCoinToken = artifacts.require('GlobCoinToken')

module.exports = function(deployer) {

  deployer.then(async () => {

    let keyValueStorage;
    let basicTokenLib;
    let standardTokenLib;
    let whitelistingTokenLib;
    let storageLib;

    let pausableTokenDelegate;
    let globCoinToken;

    keyValueStorage = await KeyValueStorage.new();
    storageLib = await StorageLib.new();
    basicTokenLib = await BasicTokenLib.new();
    standardTokenLib = await StandardTokenLib.new();
    whitelistingTokenLib = await WhitelistingTokenLib.new();

    PausableTokenDelegate.link('StorageLib', storageLib.address);
    PausableTokenDelegate.link('BasicTokenLib', basicTokenLib.address);
    PausableTokenDelegate.link('StandardTokenLib', standardTokenLib.address);
    PausableTokenDelegate.link('WhitelistingTokenLib', whitelistingTokenLib.address);

    pausableTokenDelegate = await PausableTokenDelegate.new();
    globCoinToken = await GlobCoinToken.new(keyValueStorage.address);
    await keyValueStorage.setProxyCaller(globCoinToken.address);
    await globCoinToken.upgradeTo(pausableTokenDelegate.address);

    console.log("KeyValueStorage => " + keyValueStorage.address);
    console.log("StorageLib => " + storageLib.address);
    console.log("BasicTokenLib => " + basicTokenLib.address);
    console.log("StandardTokenLib => " + standardTokenLib.address);
    console.log("WhitelistingTokenLib => " + whitelistingTokenLib.address);
    console.log("PausableTokenDelegate => " + pausableTokenDelegate.address);
    console.log("GlobCoinToken => " + globCoinToken.address);

  })

};
