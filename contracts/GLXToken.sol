pragma solidity ^0.4.24;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import 'zeppelin-solidity/contracts/access/Whitelist.sol';
import 'zeppelin-solidity/contracts/token/ERC20/ERC20.sol';
import 'zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol';
import 'zeppelin-solidity/contracts/token/ERC20/RBACMintableToken.sol';
import 'zeppelin-solidity/contracts/token/ERC20/StandardBurnableToken.sol';
import 'zeppelin-solidity/contracts/token/ERC20/StandardToken.sol';

contract GLXToken is Ownable, Whitelist, DetailedERC20, RBACMintableToken, StandardBurnableToken {

  string public constant name = "GlobCoin";
  string public constant symbol = "GLX";
  uint8 public constant decimals = 6;

  constructor() DetailedERC20(name, symbol, decimals) public {
  }

  function transfer(address _to, uint256 _value) public onlyIfWhitelisted(_to) returns (bool) {
    return super.transfer(_to, _value);
  }

}
