pragma solidity ^0.4.24;

import "../../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";
import "../Core/Storage/StorageLib.sol";

library BasicTokenLib {
    using SafeMath for uint256;

    function getBalance(StorageLib.Storage storage self, address balanceHolder) public view returns (uint256) {
        return self.store.getUintByte(abi.encodePacked("balances", balanceHolder));
    }

    function totalSupply(StorageLib.Storage storage self) public view returns (uint256) {
        return self.store.getUint("totalSupply");
    }

    function addSupply(StorageLib.Storage storage self, uint256 amount) public {
        self.store.setUint("totalSupply", totalSupply(self).add(amount));
    }

    function subSupply(StorageLib.Storage storage self, uint256 amount) public {
        self.store.setUint("totalSupply", totalSupply(self).sub(amount));
    }

    function addBalance(StorageLib.Storage storage self, address balanceHolder, uint256 amount) public {
        setBalance(self, balanceHolder, getBalance(self, balanceHolder).add(amount));
    }

    function subBalance(StorageLib.Storage storage self, address balanceHolder, uint256 amount) public {
        setBalance(self, balanceHolder, getBalance(self, balanceHolder).sub(amount));
    }

    function setBalance(StorageLib.Storage storage self, address balanceHolder, uint256 amount) private {
        self.store.setUintByte(abi.encodePacked("balances", balanceHolder), amount);
    }

}
