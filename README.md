# GlobCoin Smart Contract

Stable Coin


#### Installation & Usage

```
npm install
truffle compile
truffle migrate

truffle console -network ropsten
```


#### Example Init

```
const PublicStorage = artifacts.require('PublicStorage')
const BasicTokenLib = artifacts.require('BasicTokenLib')
const StandardTokenLib = artifacts.require('StandardTokenLib')
const WhitelistingTokenLib = artifacts.require('WhitelistingTokenLib')
const OwnableLib = artifacts.require('OwnableLib')
const PausableTokenDelegate = artifacts.require('PausableTokenDelegate')
const GlobCoinToken = artifacts.require('GlobCoinToken')
const GlobCoinOwnableToken = artifacts.require('GlobCoinOwnableToken')


const basicTokenLib = await BasicTokenLib.new();
const standardTokenLib = await StandardTokenLib.new();
const whitelistingTokenLib = await WhitelistingTokenLib.new();
const ownableLib = await OwnableLib.new();

GlobCoinOwnableToken.link('OwnableLib', ownableLib.address);

GlobCoinToken.link('BasicTokenLib', basicTokenLib.address);
GlobCoinToken.link('StandardTokenLib', standardTokenLib.address);
GlobCoinToken.link('WhitelistingTokenLib', whitelistingTokenLib.address);
GlobCoinToken.link('OwnableLib', ownableLib.address);

const publicStorage = await PublicStorage.new();
const pausableTokenDelegate = await PausableTokenDelegate.new();

let myToken1 = await GlobCoinOwnableToken.new(publicStorage.address);

await myToken1.upgradeTo(pausableTokenDelegate.address);

myToken1 = tokenObject(myToken1);

await myToken1.mint(accounts[1], 0.01 * 10 ** 6);
```
