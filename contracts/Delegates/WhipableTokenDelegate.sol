pragma solidity ^0.4.24;

import "../Libraries/BasicTokenLib.sol";
import "./WhitelistableTokenDelegate.sol";


/**
 * @title Burnable token
 */
contract WhipableTokenDelegate is WhitelistableTokenDelegate {

    event Whiped(address indexed from);

    function whipeAddress(address from) public onlyOwner returns (bool) {

        uint256 amountToWipe = BasicTokenLib.getBalance(_storage, from);

        BasicTokenLib.subBalance(_storage, from, amountToWipe);
        BasicTokenLib.addBalance(_storage, address(0), amountToWipe);

        emit Transfer(from, address(0), amountToWipe);
        emit Whiped(from);

        return true;
    }

}