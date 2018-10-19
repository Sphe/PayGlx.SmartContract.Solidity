pragma solidity ^0.4.24;

import "../../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";
import "../Core/Storage/StorageLib.sol";

library WhitelistingTokenLib {

    function getIfWhitelisted(StorageLib.Storage storage self, address who) public view returns (bool) {
        return self.store.getBool(keccak256("whitelisted", who));
    }

    function setWhitelisted(StorageLib.Storage storage self, address who, bool isWhitelisted) public {
        self.store.setBool(keccak256("whitelisted", who), isWhitelisted);
    }

}