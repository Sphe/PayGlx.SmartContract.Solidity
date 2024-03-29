pragma solidity 0.5.0;

import "../Libraries/BasicTokenLib.sol";
import "./StandardTokenDelegate.sol";


/**
 * @title Mintable token
 */
contract MintableTokenDelegate is StandardTokenDelegate {

    event Mint(address indexed to, uint256 amount);

  /**
   * @dev Function to mint tokens
   * @param to The address that will receive the minted tokens.
   * @param amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
    function mint(address to, uint256 amount) public onlyOwner returns (bool) {
        BasicTokenLib.addSupply(_storage, amount);
        BasicTokenLib.addBalance(_storage, to, amount);
        emit Mint(to, amount);
        emit Transfer(address(0), to, amount);
        return true;
    }

}