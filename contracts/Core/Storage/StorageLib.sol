pragma solidity 0.5.0;

import "./KeyValueStorage.sol";

library StorageLib {

    struct Storage {
        KeyValueStorage store;
    }

    function stringToBytes32(string memory source) public returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(source, 32))
        }
    }

}
