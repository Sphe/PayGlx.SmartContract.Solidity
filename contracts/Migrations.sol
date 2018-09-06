pragma solidity ^0.4.23;

// This is a truffle contract, needed for truffle integration.
contract Migrations {
    address public owner;
    uint256 public lastCompletedMigration;

    constructor() public {
        owner = msg.sender;
    }

    function setCompleted(uint _completed) public {
        lastCompletedMigration = _completed;
    }

    function upgrade(address _newAddress) public {
        Migrations upgraded = Migrations(_newAddress);
        upgraded.setCompleted(lastCompletedMigration);
    }
}
