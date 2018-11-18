pragma solidity 0.5.0;

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
    }

}
