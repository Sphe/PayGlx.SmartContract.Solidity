pragma solidity ^0.4.24;

import "../Libraries/BasicTokenLib.sol";
import "./OwnableDelegate.sol";


/**
 * @title Burnable token
 */
contract BurnableTokenDelegate is MintableTokenDelegate, OwnableDelegate {

    event Burn(address indexed to, uint256 amount);

  /**
   * @dev Function to burn tokens
   * @param to The address that will receive the burned tokens.
   * @param amount The amount of tokens to burn.
   * @return A boolean that indicates if the operation was successful.
   */
    function burn(uint256 amount) public onlyOwner returns (bool) {
        require(_value <= BasicTokenLib.getBalance(_storage, _who), "not enough balance");

        BasicTokenLib.subBalance(_storage, _who, _value);
        BasicTokenLib.subSupply(_storage, _value);

        emit Burn(_who, _value);
        return true;
    }

}