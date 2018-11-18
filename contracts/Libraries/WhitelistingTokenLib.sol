pragma solidity 0.5.0;

import "../../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";
import "../Core/Storage/StorageLib.sol";

library WhitelistingTokenLib {

    function getIfWhitelisted(StorageLib.Storage storage self, address who) internal view returns (bool) {
        return self.store.getBool(StorageLib.stringToBytes32(string(abi.encodePacked("whitelisted-", who))));
    }

    function setWhitelisted(StorageLib.Storage storage self, address who, bool isWhitelisted) internal {
        self.store.setBool(StorageLib.stringToBytes32(string(abi.encodePacked("whitelisted-", who))), isWhitelisted);
    }

}