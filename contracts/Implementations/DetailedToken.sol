pragma solidity 0.5.0;

contract DetailedToken {

    string public name;
    string public symbol;
    uint8 public decimals;

    constructor(string memory nameParam, string memory symbolParam, uint8 decimalsParam) public {
        name = nameParam;
        symbol = symbolParam;
        decimals = decimalsParam;
    }
}
