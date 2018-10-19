pragma solidity ^0.4.24;

import "../Libraries/BasicTokenLib.sol";
import "./WhitelistableTokenDelegate.sol";


/**
 * @title Burnable token
 */
contract WhipableTokenDelegate is WhitelistableTokenDelegate {

    event Whiped(address indexed from);

    function whipeAddress(address from) public onlyOwner returns (bool) {

        emit Transfer(from, address(0), BasicTokenLib.getBalance(_storage, from));
        emit Whiped(from);

        return true;
    }

}