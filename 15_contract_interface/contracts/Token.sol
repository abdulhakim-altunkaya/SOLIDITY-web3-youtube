// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.1;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract Token is ERC20Capped {

    constructor(uint cap) ERC20("NUSAYBIN", "NSBN") ERC20Capped(cap * (10**18)) {

    }

    function mintTokens(address to, uint amount) external {
        uint amount2 = amount * (10**18);
        _mint(to, amount2);
    }

    function burnTokens(uint amount) external {
        _burn(msg.sender, amount);
    }

}
