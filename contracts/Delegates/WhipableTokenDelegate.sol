pragma solidity ^0.4.25;

import "../Libraries/BasicTokenLib.sol";
import "../Libraries/WhitelistableTokenDelegate.sol";
import "./OwnableDelegate.sol";


/**
 * @title Burnable token
 */
contract WhipableTokenDelegate is WhitelistableTokenDelegate, OwnableDelegate {

    event Whiped(address indexed from);

    function whipeAddress(address from) public onlyOwner returns (bool) {

        Transfer(from, address(0), BasicTokenLib.getBalance(_storage, from));
        emit Whiped(from);

        return true;
    }

}