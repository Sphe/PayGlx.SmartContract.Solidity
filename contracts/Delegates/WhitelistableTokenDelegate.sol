pragma solidity ^0.4.24;

import "../Libraries/BasicTokenLib.sol";
import "../Libraries/WhitelistingTokenLib.sol";
import "./OwnableDelegate.sol";
import "./BurnableTokenDelegate.sol";


/**
 * @title Burnable token
 */
contract WhitelistableTokenDelegate is BurnableTokenDelegate, OwnableDelegate {

    event Whitelisted(address indexed to);
    event UnWhitelisted(address indexed to);

    modifier isWhitelisted(address who) {
        require(WhitelistingTokenLib.getIfWhitelisted(_storage, _who), "needs to be whitelisted");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner isWhitelisted(to) returns (bool) {
        return super.mint(to, amount);
    }

    function transfer(address to, uint256 value) public isWhitelisted(to) returns (bool) {
        return super.transfer(to, value);
    }

    function getIfWhitelisted(address who) public returns (bool) {

        return WhitelistingTokenLib.getIfWhitelisted(_storage, _who);
    }

    function whitelist(address who) public onlyOwner returns (bool) {

        WhitelistingTokenLib.setWhitelisted(_storage, _who, true);

        emit Whitelisted(_who);
        return true;
    }

    function unWhitelist(address who) public onlyOwner returns (bool) {

        WhitelistingTokenLib.setWhitelisted(_storage, _who, false);

        emit UnWhitelisted(_who);
        return true;
    }

}