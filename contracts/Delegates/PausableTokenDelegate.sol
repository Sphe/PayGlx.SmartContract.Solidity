pragma solidity 0.5.0;

import "../../node_modules/openzeppelin-solidity/contracts/lifecycle/Pausable.sol";

import "../Libraries/BasicTokenLib.sol";
import "./WipeableTokenDelegate.sol";

/**
 * @title Burnable token
 */
contract PausableTokenDelegate is WipeableTokenDelegate, Pausable {

    function transfer(
        address _to,
        uint256 _value
    )
    public
    whenNotPaused
    returns (bool)
    {
        return super.transfer(_to, _value);
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    )
    public
    whenNotPaused
    returns (bool)
    {
        return super.transferFrom(_from, _to, _value);
    }

    function approve(
        address _spender,
        uint256 _value
    )
    public
    whenNotPaused
    returns (bool)
    {
        return super.approve(_spender, _value);
    }

    function increaseApproval(
        address _spender,
        uint _addedValue
    )
    public
    whenNotPaused
    returns (bool success)
    {
        return super.increaseApproval(_spender, _addedValue);
    }

    function decreaseApproval(
        address _spender,
        uint _subtractedValue
    )
    public
    whenNotPaused
    returns (bool success)
    {
        return super.decreaseApproval(_spender, _subtractedValue);
    }

}
