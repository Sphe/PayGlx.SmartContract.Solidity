pragma solidity ^0.4.23;

import "../GlobCoin.sol";

contract GlobCoinMock is GlobCoin {
    constructor(address initialAccount, uint256 initialBalance) public {
        balances = new BalanceSheet();
        allowances = new AllowanceSheet();
        balances.setBalance(initialAccount, initialBalance);
        totalSupply_ = initialBalance;
    }
}
