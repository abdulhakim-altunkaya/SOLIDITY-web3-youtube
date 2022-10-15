// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract TokenA is ERC20Capped {

    constructor(uint cap) ERC20("TokenA", "AAAAA") ERC20Capped(cap * (10**18)) {

    }

    function mintTokens(address to, uint amount) external {
        uint amount2 = amount * (10**18);
        _mint(to, amount2);
    }

    function burnTokens(uint amount) external {
        uint amount2 = amount * (10**18);
        _burn(msg.sender, amount2);
    }


}
