pragma solidity 0.5.0;

import "../../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";
import "../Core/Storage/StorageLib.sol";

library StandardTokenLib {
    using SafeMath for uint256;

    function getAllowed(
        StorageLib.Storage storage self,
        address owner,
        address spender
    )
      internal view returns (uint256)
    {
        return self.store.getUint(string(abi.encodePacked("allowed-", owner, spender)));
    }

    function addAllowed(
        StorageLib.Storage storage self,
        address owner,
        address spender,
        uint256 amount
    )
      internal
    {
        setAllowed(self, owner, spender, getAllowed(self, owner, spender).add(amount));
    }

    function subAllowed(
        StorageLib.Storage storage self,
        address owner,
        address spender,
        uint256 amount
    )
      internal
    {
        setAllowed(self, owner, spender, getAllowed(self, owner, spender).sub(amount));
    }

    function setAllowed(
        StorageLib.Storage storage self,
        address owner,
        address spender,
        uint256 amount
    )
      internal 
    {
        self.store.setUint(string(abi.encodePacked("allowed-", owner, spender)), amount);
    }

}
