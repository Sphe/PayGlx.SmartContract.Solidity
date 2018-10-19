pragma solidity ^0.4.25;

import "../Libraries/OwnableLib.sol";
import "../Core/Storage/KeyValueStorage.sol";
import "./GlobCoinToken.sol";

contract GlobCoinOwnableToken is GlobCoinToken {

    string public constant NAME = "GlobCoin";
    string public constant SYMBOL = "GLX";
    uint8 public constant DECIMALS = 6;

    constructor(KeyValueStorage store)
    public
    GlobCoinToken(store, NAME, SYMBOL, DECIMALS)
    {
        OwnableLib.setOwner(_storage, msg.sender);
    }

}
