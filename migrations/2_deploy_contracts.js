var NamableAddressList = artifacts.require("NamableAddressList");
var BalanceSheet = artifacts.require("BalanceSheet");
var AllowanceSheet = artifacts.require("AllowanceSheet");
var GlobCoin = artifacts.require("GlobCoin");
var TimeLockedController = artifacts.require("TimeLockedController");
//var AddressValidation = artifacts.require("AddressValidation");
var Web3 = require('web3');

module.exports = async function(deployer) {
  //await deployer;

  //deployer.deploy(NamableAddressList, "mintWhiteList", true);

  //deployer.deploy(NamableAddressList, "canBurnWhiteList", true);

  //deployer.deploy(NamableAddressList, "blackList", true);

  //deployer.deploy(NamableAddressList, "noFeesList", true);

  deployer.deploy(BalanceSheet);
  deployer.deploy(AllowanceSheet);

  deployer.deploy(GlobCoin)
  deployer.deploy(TimeLockedController);

  //const addressValidation = AddressValidation.at("0x513326b92d5d0146c493fa9fe2427e04bc31d2a2")

  const mintWhiteList = NamableAddressList.at("0x6fff65fda96039e97a477a30bee467341f52deec")
  const canBurnWhiteList = NamableAddressList.at("0xf4f2f04fce7541fbb9894799dc4b58d31714fc99")
  const blackList = NamableAddressList.at("0x46f6f15f73de47effbd668622ce50626d3bde6b4")
  const noFeesList = NamableAddressList.at("0x3cd76e33fb885cff0ab5806407f73b1453d0733f")
  const balances = BalanceSheet.at("0x57F256697d5b108C7a810037fd07C1fe16477212")
  const allowances = AllowanceSheet.at("0x513326b92d5d0146c493fa9fe2427e04bc31d2a2")
  const GlobCoinlocal = GlobCoin.at("0x5f95007fc001e57236390c8ce66e32162f5d3b7a")
  const timeLockedController = TimeLockedController.at("0xb953f4d34592400422e3254bb49700f90892d4d4")

  console.log("Create the small contracts that GlobCoin depends on...")
  //const addressValidation = await AddressValidation.new()
  //console.log("addressValidation Address: ", addressValidation.address)
  //const mintWhiteList = await NamableAddressList.new("mintWhiteList", true)
  console.log("mintWhiteList Address: ", mintWhiteList.address)
  //const canBurnWhiteList = await NamableAddressList.new("canBurnWhiteList", true)
  console.log("canBurnWhiteList Address: ", canBurnWhiteList.address)
  //const blackList = await NamableAddressList.new("blackList", true)
  console.log("blackList Address: ", blackList.address)
  //const noFeesList = await NamableAddressList.new("noFeesList", true)
  console.log("noFeesList Address: ", noFeesList.address)
  //const balances = await BalanceSheet.new()
  console.log("balanceSheet Address: ", BalanceSheet.address)
  //const allowances = await AllowanceSheet.new()
  console.log("allowanceSheet Address: ", AllowanceSheet.address)

  console.log("Create and configure GlobCoin...")
  //const GlobCoinlocal = await GlobCoin.new()
  console.log("GlobCoin Address: ", GlobCoinlocal.address)
  //await balances.transferOwnership(GlobCoinlocal.address)
  //await allowances.transferOwnership(GlobCoinlocal.address)
  //await GlobCoinlocal.setBalanceSheet(balances.address)
  //await GlobCoinlocal.setAllowanceSheet(allowances.address)
  //await GlobCoinlocal.setLists(mintWhiteList.address, canBurnWhiteList.address, blackList.address)
  //await GlobCoinlocal.setNoFeesList(noFeesList.address)
  //await GlobCoin.changeStaker("0x960Ab0dea96ab2dB293F162e6047306154588E8B")

  console.log("Create TimeLockedController and transfer ownership of other contracts to it...")
  //const timeLockedController = await TimeLockedController.new()
  console.log("timeLockedController Address: ", TimeLockedController.address)
  //await mintWhiteList.transferOwnership(TimeLockedController.address)
  //await timeLockedController.issueClaimOwnership(mintWhiteList.address)
  //await canBurnWhiteList.transferOwnership(timeLockedController.address)
  //await timeLockedController.issueClaimOwnership(canBurnWhiteList.address)
  //await blackList.transferOwnership(timeLockedController.address)
  //await timeLockedController.issueClaimOwnership(blackList.address)
  //await noFeesList.transferOwnership(timeLockedController.address)
  //await timeLockedController.issueClaimOwnership(noFeesList.address)
  //await GlobCoinlocal.transferOwnership(timeLockedController.address)
  //await timeLockedController.issueClaimOwnership(GlobCoinlocal.address)
  //await timeLockedController.setGlobCoin(GlobCoinlocal.address)

  console.log("Transfer admin/ownership of TimeLockedController...")
  //await timeLockedController.transferAdminship("0xc6b70ea068e23fe04a1d46c138d5048a8a394b4e")
  //await timeLockedController.transferOwnership("0xc6b70ea068e23fe04a1d46c138d5048a8a394b4e")

  console.log("Deployment successful")
};
