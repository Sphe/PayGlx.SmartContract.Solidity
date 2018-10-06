pragma solidity ^0.4.23;

import "../TimeLockedController.sol";

/*
Allows for admins to quickly respond to critical emergencies
After deploying FastPauseGlobCoin and configuring it with TimeLockedController
Can pause GlobCoin by simply sending any amount of ether to this contract
from the GlobCoinPauser address
*/
contract FastPauseGlobCoin {
    
    TimeLockedController public controllerContract;
    address public GlobCoinPauser;
    
    event FastGlobCoinPause(address sender);

    constructor (address _GlobCoinPauser, address _controllerContract) public {
        controllerContract = TimeLockedController(_controllerContract);
        GlobCoinPauser = _GlobCoinPauser;
    }
    
    modifier onlyPauser() {
        require(msg.sender == GlobCoinPauser, "not GlobCoin pauser");
        _;
    }

    //fallback function used to pause GlobCoin when it recieves eth
    function() public payable onlyPauser {
        emit FastGlobCoinPause(msg.sender);
        msg.sender.transfer(msg.value);
        controllerContract.pauseGlobCoin();
    }
}