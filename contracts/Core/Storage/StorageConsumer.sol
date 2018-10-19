pragma solidity ^0.4.24;

import "./KeyValueStorage.sol";
import "./StorageState.sol";

contract StorageConsumer is StorageState {

    constructor(KeyValueStorage store) public {
        _storage.store = store;
    }

}
