pragma solidity 0.5.0;

import "../Core/Proxy/OwnableProxy.sol";
import "../Core/Storage/KeyValueStorage.sol";
import "../Core/Storage/StorageConsumer.sol";
import "./DetailedToken.sol";

contract GenericErc20Token is StorageConsumer, OwnableProxy, DetailedToken {

    constructor(KeyValueStorage store, string _name, string _symbol, uint8 _decimals)
        public
        StorageConsumer(store)
        DetailedToken(_name, _symbol, _decimals)
    { }

}
