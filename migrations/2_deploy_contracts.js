var NamableAddressList = artifacts.require("NamableAddressList");
var BalanceSheet = artifacts.require("BalanceSheet");
var AllowanceSheet = artifacts.require("AllowanceSheet");
var GlobCoin = artifacts.require("GlobCoin");
var TimeLockedController = artifacts.require("TimeLockedController");
//var AddressValidation = artifacts.require("AddressValidation");
var Web3 = require('web3');

module.exports = async function(deployer) {
  deployer.deploy(NamableAddressList, "mintWhiteList", true);
  deployer.deploy(NamableAddressList, "canBurnWhiteList", true);
  deployer.deploy(NamableAddressList, "blackList", true);
  deployer.deploy(NamableAddressList, "noFeesList", true);

  deployer.deploy(BalanceSheet);
  deployer.deploy(AllowanceSheet);
  deployer.deploy(GlobCoin, { gas: 12000000 })
  deployer.deploy(TimeLockedController);
  
  // const addressValidation = AddressValidation.at("0x42Af5f733e8ecE22063FD516a5f1b246D6923eC0")
  // const mintWhiteList = NamableAddressList.at("0xf2ec422d6eeb805eff207b1e358947cbd73b129d")
  // const canBurnWhiteList = NamableAddressList.at("0x844De59c9A8D428283923fb752002fafe2aa694a")
  // const blackList = NamableAddressList.at("0xf5de41317a8fde99108e2fa2d26822bebad1427e")
  // const noFeesList = NamableAddressList.at("0x9f59b4f7d3bd00caa85e61c57761768291155084")
  // const balances = BalanceSheet.at("0x6dea55ba04a37fddd05e1fd979c30aa0e634e837")
  // const allowances = AllowanceSheet.at("0x811c5f8dfbdd70c245e66e4cd181040b2630424a")
  // const GlobCoin = GlobCoin.at("0x8dd5fbCe2F6a956C3022bA3663759011Dd51e73E")
  // const timeLockedController = TimeLockedController.at("0x9978d2d229a69b3aef93420d132ab22b44e3578f")

  // console.log("Create the small contracts that GlobCoin depends on...")
  // //const addressValidation = await AddressValidation.new()
  // //console.log("addressValidation Address: ", addressValidation.address)
  // const mintWhiteList = await NamableAddressList.new("mintWhiteList", true)
  // console.log("mintWhiteList Address: ", mintWhiteList.address)
  // const canBurnWhiteList = await NamableAddressList.new("canBurnWhiteList", true)
  // console.log("canBurnWhiteList Address: ", canBurnWhiteList.address)
  // const blackList = await NamableAddressList.new("blackList", true)
  // console.log("blackList Address: ", blackList.address)
  // const noFeesList = await NamableAddressList.new("noFeesList", true)
  // console.log("noFeesList Address: ", noFeesList.address)
  // const balances = await BalanceSheet.new()
  // console.log("balanceSheet Address: ", balances.address)
  // const allowances = await AllowanceSheet.new()
  // console.log("allowanceSheet Address: ", allowances.address)

  // console.log("Create and configure GlobCoin...")
  // const GlobCoinlocal = await GlobCoin.new()
  // console.log("GlobCoin Address: ", GlobCoinlocal.address)
  // await balances.transferOwnership(GlobCoin.address)
  // await allowances.transferOwnership(GlobCoin.address)
  // await GlobCoinlocal.setBalanceSheet(balances.address)
  // await GlobCoinlocal.setAllowanceSheet(allowances.address)
  // await GlobCoinlocal.setLists(mintWhiteList.address, canBurnWhiteList.address, blackList.address)
  // await GlobCoinlocal.setNoFeesList(noFeesList.address)
  // //await GlobCoin.changeStaker("0x960Ab0dea96ab2dB293F162e6047306154588E8B")

  // console.log("Create TimeLockedController and transfer ownership of other contracts to it...")
  // const timeLockedController = await TimeLockedController.new()
  // console.log("timeLockedController Address: ", timeLockedController.address)
  // await mintWhiteList.transferOwnership(timeLockedController.address)
  // await timeLockedController.issueClaimOwnership(mintWhiteList.address)
  // await canBurnWhiteList.transferOwnership(timeLockedController.address)
  // await timeLockedController.issueClaimOwnership(canBurnWhiteList.address)
  // await blackList.transferOwnership(timeLockedController.address)
  // await timeLockedController.issueClaimOwnership(blackList.address)
  // await noFeesList.transferOwnership(timeLockedController.address)
  // await timeLockedController.issueClaimOwnership(noFeesList.address)
  // await GlobCoin.transferOwnership(timeLockedController.address)
  // await timeLockedController.issueClaimOwnership(GlobCoin.address)
  // await timeLockedController.setGlobCoin(GlobCoin.address)

  // console.log("Transfer admin/ownership of TimeLockedController...")
  // await timeLockedController.transferAdminship("0xB759E6C032e55670D62743aA6354A2c760bd80f3")
  // await timeLockedController.transferOwnership("0x19F2F5565fa39A09aaa4f4e1073150f1f17776b0")

  // console.log("Deployment successful")
};
