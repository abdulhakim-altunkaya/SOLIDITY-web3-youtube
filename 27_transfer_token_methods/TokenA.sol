// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract TokenA is ERC20Capped {
    constructor(uint _cap) ERC20("TokenA", "TOKA") ERC20Capped(_cap*(10**18)) {
    }

    function mintOwner(uint _amount) external {
        _mint(msg.sender, _amount*(10**18));
    }

    function getYourBalance() external view returns(uint) {
        return balanceOf(msg.sender) / (10**18);
    }
}