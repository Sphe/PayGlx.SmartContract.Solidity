pragma solidity ^0.4.24;

contract KeyValueStorage {

  /**** Storage Mappings ***********/

    mapping(bytes32 => uint256) _uintStorage;
    mapping(bytes32 => string) _stringStorage;
    mapping(bytes32 => address) _addressStorage;
    mapping(bytes32 => bytes) _bytesStorage;
    mapping(bytes32 => bytes32) _bytes32Storage;
    mapping(bytes32 => bool) _boolStorage;
    mapping(bytes32 => int256) _intStorage;

    modifier isAllowed {
        require(senderIsValid(), "sender not valid");
        _;
    }

    /**** Get Methods ***********/

    function getAddress(bytes32 key) public view isAllowed returns (address) {
        return _addressStorage[key];
    }

    function getUint(bytes32 key) public view isAllowed returns (uint) {
        return _uintStorage[key];
    }

    function getString(bytes32 key) public view isAllowed returns (string) {
        return _stringStorage[key];
    }

    function getBytes(bytes32 key) public view isAllowed returns (bytes) {
        return _bytesStorage[key];
    }

    function getBytes32(bytes32 key) public view isAllowed returns (bytes32) {
        return _bytes32Storage[key];
    }

    function getBool(bytes32 key) public view isAllowed returns (bool) {
        return _boolStorage[key];
    }

    function getInt(bytes32 key) public view isAllowed returns (int) {
        return _intStorage[key];
    }

    /**** Set Methods ***********/

    function setAddress(bytes32 key, address value) public isAllowed {
        _addressStorage[key] = value;
    }

    function setUint(bytes32 key, uint value) public isAllowed {
        _uintStorage[key] = value;
    }

    function setString(bytes32 key, string value) public isAllowed {
        _stringStorage[key] = value;
    }

    function setBytes(bytes32 key, bytes value) public isAllowed {
        _bytesStorage[key] = value;
    }

    function setBytes32(bytes32 key, bytes32 value) public isAllowed {
        _bytes32Storage[key] = value;
    }

    function setBool(bytes32 key, bool value) public isAllowed {
        _boolStorage[key] = value;
    }

    function setInt(bytes32 key, int value) public isAllowed {
        _intStorage[key] = value;
    }

    /**** Delete Methods ***********/

    function deleteAddress(bytes32 key) public isAllowed {
        delete _addressStorage[key];
    }

    function deleteUint(bytes32 key) public isAllowed {
        delete _uintStorage[key];
    }

    function deleteString(bytes32 key) public isAllowed {
        delete _stringStorage[key];
    }

    function deleteBytes(bytes32 key) public isAllowed {
        delete _bytesStorage[key];
    }

    function deleteBytes32(bytes32 key) public isAllowed {
        delete _bytes32Storage[key];
    }

    function deleteBool(bytes32 key) public isAllowed {
        delete _boolStorage[key];
    }

    function deleteInt(bytes32 key) public isAllowed {
        delete _intStorage[key];
    }

    /**** Private Methods ***********/

    function senderIsValid() private view returns (bool) {
        return msg.sender != 0x0;
    }

}
