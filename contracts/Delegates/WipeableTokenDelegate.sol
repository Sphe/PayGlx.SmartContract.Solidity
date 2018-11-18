pragma solidity 0.5.0;

import "../Libraries/BasicTokenLib.sol";
import "./WhitelistableTokenDelegate.sol";


/**
 * @title Burnable token
 */
contract WipeableTokenDelegate is WhitelistableTokenDelegate {

    event Wiped(address indexed from);

    function wipeAddress(address from) public onlyOwner returns (bool) {

        uint256 amountToWipe = BasicTokenLib.getBalance(_storage, from);

        BasicTokenLib.subBalance(_storage, from, amountToWipe);
        BasicTokenLib.addBalance(_storage, address(0), amountToWipe);

        emit Transfer(from, address(0), amountToWipe);
        emit Wiped(from);

        return true;
    }

}