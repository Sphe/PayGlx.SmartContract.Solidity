pragma solidity ^0.4.24;

import "../Libraries/OwnableLib.sol";
import "../Core/Storage/KeyValueStorage.sol";
import "./GenericErc20Token.sol";

contract GlobCoinToken is GenericErc20Token {

    string public constant NAME = "GlobCoin";
    string public constant SYMBOL = "GLX";
    uint8 public constant DECIMALS = 6;

    constructor(KeyValueStorage store)
    public
    GenericErc20Token(store, NAME, SYMBOL, DECIMALS)
    {
        OwnableLib.setOwner(_storage, msg.sender);
    }

}
