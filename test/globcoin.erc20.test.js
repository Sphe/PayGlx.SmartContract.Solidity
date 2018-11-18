
import _ from 'lodash'
import { expect } from 'chai'
import { web3 } from './helpers/w3'
import expectRevert from './helpers/expectRevert';

const accounts = web3.eth.accounts

const KeyValueStorage = artifacts.require('KeyValueStorage')
const BasicTokenLib = artifacts.require('BasicTokenLib')
const StandardTokenLib = artifacts.require('StandardTokenLib')
const WhitelistingTokenLib = artifacts.require('WhitelistingTokenLib')
const StorageLib = artifacts.require('StorageLib')
const PausableTokenDelegate = artifacts.require('PausableTokenDelegate')
const GlobCoinToken = artifacts.require('GlobCoinToken')

describe('GlobCoin Main Functionalities', () => {
  describe('General', async () => {

    let keyValueStorage
    let basicTokenLib
    let standardTokenLib
    let whitelistingTokenLib
    let storageLib

    let pausableTokenDelegate
    let globCoinToken

    beforeEach('setup contract for each test', async function () {
      keyValueStorage = await KeyValueStorage.new()
      basicTokenLib = await BasicTokenLib.new()
      standardTokenLib = await StandardTokenLib.new()
      whitelistingTokenLib = await WhitelistingTokenLib.new()
      storageLib = await StorageLib.new()

      PausableTokenDelegate.link('StorageLib', storageLib.address);
      PausableTokenDelegate.link('BasicTokenLib', basicTokenLib.address);
      PausableTokenDelegate.link('StandardTokenLib', standardTokenLib.address);
      PausableTokenDelegate.link('WhitelistingTokenLib', whitelistingTokenLib.address);

      pausableTokenDelegate = await PausableTokenDelegate.new()
      globCoinToken = await GlobCoinToken.new(keyValueStorage.address)
      await globCoinToken.upgradeTo(pausableTokenDelegate.address)
      await keyValueStorage.setProxyCaller(globCoinToken.address);
    })

    it('should be able to whitelist and mint to a new user', async () => {

      let pausableToken = tokenObjectForPausableDelegate(globCoinToken)
      await pausableToken.whitelist(accounts[1])
      await pausableToken.mint(accounts[1], 1000000)
      expect((await pausableToken.balanceOf(accounts[1])).toNumber()).to.equal(1000000)

    })

    it('should be able to wipe and unwhitelist an existing user', async () => {

      let pausableToken = tokenObjectForPausableDelegate(globCoinToken)
      await pausableToken.whitelist(accounts[1])
      await pausableToken.mint(accounts[1], 1000000)
      expect((await pausableToken.balanceOf(accounts[1])).toNumber()).to.equal(1000000)

      await pausableToken.wipeAddress(accounts[1])
      await pausableToken.unWhitelist(accounts[1])
      await expectRevert(pausableToken.mint(accounts[1], 1000000))

    })

    it('should be able to transfer from one user to another', async () => {

      let pausableToken = tokenObjectForPausableDelegate(globCoinToken)
      await pausableToken.whitelist(accounts[1])
      await pausableToken.mint(accounts[1], 1000000)
      expect((await pausableToken.balanceOf(accounts[1])).toNumber()).to.equal(1000000)

      await pausableToken.whitelist(accounts[2])
      expect((await pausableToken.balanceOf(accounts[2])).toNumber()).to.equal(0)

      await pausableToken.transfer.sendTransaction(accounts[2], 500000, {from: accounts[1]})
      expect((await pausableToken.balanceOf(accounts[2])).toNumber()).to.equal(500000)
    })

    it('owner should be able to burn from his account', async () => {

      let pausableToken = tokenObjectForPausableDelegate(globCoinToken)
      await pausableToken.whitelist(accounts[1])
      await pausableToken.mint(accounts[1], 1000000)
      expect((await pausableToken.balanceOf(accounts[1])).toNumber()).to.equal(1000000)

      await pausableToken.wipeAddress(accounts[1])

      await pausableToken.burn.sendTransaction(100000, {from: accounts[0]})
      expect((await pausableToken.totalSupply()).toNumber()).to.equal(900000)
    })


  })
})

function tokenObjectForPausableDelegate (token) {
  return _.extend(
    token,
    PausableTokenDelegate.at(token.address)
  )
}
