pragma solidity ^0.4.24;

import "./modularERC20/ModularPausableToken.sol";
import "./CanDelegate.sol";
import "./BurnableTokenWithBounds.sol";
import "./CompliantToken.sol";
import "./TokenWithFees.sol";
import "./StandardDelegate.sol";
import "./WithdrawalToken.sol";

// This is the top-level ERC20 contract, but most of the interesting functionality is
// inherited - see the documentation on the corresponding contracts.
contract GlobCoin is ModularPausableToken, BurnableTokenWithBounds, CompliantToken, TokenWithFees, WithdrawalToken, StandardDelegate, CanDelegate {

    string public name = "GlobCoin";
    string public symbol = "GLX";
    uint8 public constant decimals = 6;
    uint8 public constant rounding = 2;

    event ChangeTokenName(string newName, string newSymbol);

    constructor() public {
        totalSupply_ = 0;
        burnMin = 10000 * 10**uint256(decimals);
        burnMax = 20000000 * 10**uint256(decimals);
    }

    function changeTokenName(string _name, string _symbol) public {
        name = _name;
        symbol = _symbol;
        emit ChangeTokenName(_name, _symbol);
    }

    function mint(address _to, uint256 _value) public returns (bool) {
        super.mint(_to, _value);
    }
    function setBalanceSheet(address _sheet) public returns (bool) {
        return super.setBalanceSheet(_sheet);
    }
    function setAllowanceSheet(address _sheet) public returns (bool) {
        return super.setAllowanceSheet(_sheet);
    }
    function setBurnBounds(uint256 _min, uint256 _max) public {
        super.setBurnBounds(_min, _max);
    }
    function setRegistry(Registry _registry) public {
        super.setRegistry(_registry);
    }
    function changeStaker(address _newStaker) public {
        super.changeStaker(_newStaker);
    }
    function wipeBlacklistedAccount(address _account) public {
        super.wipeBlacklistedAccount(_account);
    }

    function changeStakingFees(
        uint256 _transferFeeNumerator,
        uint256 _transferFeeDenominator,
        uint256 _mintFeeNumerator,
        uint256 _mintFeeDenominator,
        uint256 _mintFeeFlat,
        uint256 _burnFeeNumerator,
        uint256 _burnFeeDenominator,
        uint256 _burnFeeFlat
    ) public {
        super.changeStakingFees(
            _transferFeeNumerator,
            _transferFeeDenominator,
            _mintFeeNumerator,
            _mintFeeDenominator,
            _mintFeeFlat,
            _burnFeeNumerator,
            _burnFeeDenominator,
            _burnFeeFlat
        );
    }

    function burnAllArgs(address _burner, uint256 _value ,string _note) internal {
      //round down burn amount to cent
      uint burnAmount = _value / (10 **uint256(decimals-rounding)) * (10 **uint256(decimals-rounding));
      super.burnAllArgs(_burner, burnAmount, _note);
    }


    // Alternatives to the normal NoOwner functions in case this contract's owner
    // can't own ether or tokens.
    // Note that we *do* inherit reclaimContract from NoOwner: This contract
    // does have to own contracts, but it also has to be able to relinquish them.
    function reclaimEther(address _to) external {
        _to.transfer(address(this).balance);
    }

    function reclaimToken(ERC20Basic token, address _to) external {
        uint256 balance = token.balanceOf(this);
        //token.safeTransfer(_to, balance);
    }

}
