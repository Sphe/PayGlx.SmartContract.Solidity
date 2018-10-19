pragma solidity ^0.4.24;

import "../../../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "./BaseProxy.sol";

contract OwnableProxy is BaseProxy, Ownable {

    event Upgraded(address indexed implementation);

    address internal _implementation;

    function implementation() public view returns (address) {
        return _implementation;
    }

    function upgradeTo(address impl) public onlyOwner {
        require(_implementation != impl, "new adress must differs from current used one");
        _implementation = impl;
        emit Upgraded(impl);
    }
}
