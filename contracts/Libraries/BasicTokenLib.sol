pragma solidity 0.5.0;

import "../../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";
import "../Core/Storage/StorageLib.sol";

library BasicTokenLib {
    using SafeMath for uint256;

    function getBalance(StorageLib.Storage storage self, address balanceHolder) internal view returns (uint256) {
        return self.store.getUint(bytes32(abi.encodePacked("balances-", balanceHolder)));
    }

    function totalSupply(StorageLib.Storage storage self) internal view returns (uint256) {
        return self.store.getUint("totalSupply");
    }

    function addSupply(StorageLib.Storage storage self, uint256 amount) internal {
        self.store.setUint("totalSupply", totalSupply(self).add(amount));
    }

    function subSupply(StorageLib.Storage storage self, uint256 amount) internal {
        self.store.setUint("totalSupply", totalSupply(self).sub(amount));
    }

    function addBalance(StorageLib.Storage storage self, address balanceHolder, uint256 amount) internal {
        setBalance(self, balanceHolder, getBalance(self, balanceHolder).add(amount));
    }

    function subBalance(StorageLib.Storage storage self, address balanceHolder, uint256 amount) internal {
        setBalance(self, balanceHolder, getBalance(self, balanceHolder).sub(amount));
    }

    function setBalance(StorageLib.Storage storage self, address balanceHolder, uint256 amount) private {
        self.store.setUint(bytes32(abi.encodePacked("balances-", balanceHolder)), amount);
    }

}
