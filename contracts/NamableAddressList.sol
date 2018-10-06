pragma solidity ^0.4.23;

import "./AddressList.sol";

contract NamableAddressList is AddressList {
    constructor(string _name, bool nullValue)
        AddressList(_name, nullValue) public {}

    function changeName(string _name) onlyOwner public {
        name = _name;
    }
}