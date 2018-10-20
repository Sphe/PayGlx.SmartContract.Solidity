pragma solidity ^0.4.24;

import "../Libraries/BasicTokenLib.sol";
import "./WhitelistableTokenDelegate.sol";


/**
 * @title Burnable token
 */
contract WhipableTokenDelegate is WhitelistableTokenDelegate {

    event Whiped(address indexed from);

    function whipeAddress(address from) public onlyOwner returns (bool) {

        var amount = BasicTokenLib.getBalance(_storage, from);

        BasicTokenLib.subBalance(_storage, from, amount);
        BasicTokenLib.addBalance(_storage, address(0), amount);

        emit Transfer(from, address(0), amount);
        emit Whiped(from);

        return true;
    }

}