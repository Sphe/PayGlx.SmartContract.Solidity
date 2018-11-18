pragma solidity 0.5.0;

import "../Libraries/BasicTokenLib.sol";
import "./MintableTokenDelegate.sol";


/**
 * @title Burnable token
 */
contract BurnableTokenDelegate is MintableTokenDelegate {

    event Burn(address indexed to, uint256 amount);

  /**
   * @dev Function to burn tokens
   * @param amount The amount of tokens to burn.
   * @return A boolean that indicates if the operation was successful.
   */
    function burn(uint256 amount) public onlyOwner returns (bool) {
        require(amount <= BasicTokenLib.getBalance(_storage, address(0)), "not enough balance");

        BasicTokenLib.subBalance(_storage, address(0), amount);
        BasicTokenLib.subSupply(_storage, amount);

        emit Burn(address(0), amount);
        return true;
    }

}