pragma solidity ^0.4.24;

import "../Libraries/BasicTokenLib.sol";
import "../Libraries/WhitelistingTokenLib.sol";
import "./BurnableTokenDelegate.sol";


/**
 * @title Burnable token
 */
contract WhitelistableTokenDelegate is BurnableTokenDelegate {

    event Whitelisted(address indexed to);
    event UnWhitelisted(address indexed to);

    modifier isWhitelisted(address who) {
        require(WhitelistingTokenLib.getIfWhitelisted(_storage, who), "needs to be whitelisted");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner isWhitelisted(to) returns (bool) {
        return super.mint(to, amount);
    }

    function transfer(address to, uint256 value) public isWhitelisted(to) returns (bool) {
        return super.transfer(to, value);
    }

    function getIfWhitelisted(address who) public view returns (bool) {
        return WhitelistingTokenLib.getIfWhitelisted(_storage, who);
    }

    function whitelist(address who) public onlyOwner returns (bool) {
        WhitelistingTokenLib.setWhitelisted(_storage, who, true);
        emit Whitelisted(who);
        return true;
    }

    function unWhitelist(address who) public onlyOwner returns (bool) {
        WhitelistingTokenLib.setWhitelisted(_storage, who, false);
        emit UnWhitelisted(who);
        return true;
    }

}