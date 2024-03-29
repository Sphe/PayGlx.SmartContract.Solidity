pragma solidity 0.5.0;

import "../../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "../../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20Basic.sol";
import "../../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";
import "../Libraries/BasicTokenLib.sol";
import "../Core/Storage/StorageState.sol";

contract BasicTokenDelegate is StorageState, ERC20Basic, Ownable {
 
  /**
  * @dev total number of tokens in existence
  */
    function totalSupply() public view returns (uint256) {
        return BasicTokenLib.totalSupply(_storage);
    }

  /**
  * @dev transfer token for a specified address
  * @param to The address to transfer to.
  * @param value The amount to be transferred.
  */
    function transfer(address to, uint256 value) public returns (bool) {
        require(to != address(0), "sender needs to differs from receiver");
        require(value <= BasicTokenLib.getBalance(_storage, msg.sender), "not enough balance");

        BasicTokenLib.subBalance(_storage, msg.sender, value);
        BasicTokenLib.addBalance(_storage, to, value);
        emit Transfer(msg.sender, to, value);
        return true;
    }

  /**
  * @dev Gets the balance of the specified address.
  * @param owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
    function balanceOf(address owner) public view returns (uint256 balance) {
        return BasicTokenLib.getBalance(_storage, owner);
    }

}
