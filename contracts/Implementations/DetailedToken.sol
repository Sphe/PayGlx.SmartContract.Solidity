pragma solidity ^0.4.25;

contract DetailedToken {

    string public _name;
    string public _symbol;
    uint8 public _decimals;

    constructor(string name, string symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }
}