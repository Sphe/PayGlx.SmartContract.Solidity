pragma solidity ^0.4.24;

contract DetailedToken {

    string public name;
    string public symbol;
    uint8 public decimals;

    constructor(string nameParam, string symbolParam, uint8 decimalsParam) public {
        name = nameParam;
        symbol = symbolParam;
        decimals = decimalsParam;
    }
}