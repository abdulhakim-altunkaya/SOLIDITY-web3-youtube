// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract TokenBank {

    //this returns ether balance
    function getEtherBalance() external view returns(uint) {
        return address(this).balance;
    }

    function getTokenBalance(address tokenAddress) external view returns(uint) {
        return IERC20(tokenAddress).balanceOf(address(this));
    }

    function withdraw1( address tokenAddress, address receiver) external {
        IERC20 token = IERC20(tokenAddress);
        token.transfer(receiver, token.balanceOf(address(this))  );
    }

    function withdraw2( address tokenAddress, address receiver, uint amount) external {
        IERC20 token = IERC20(tokenAddress);
        uint amount2 = amount * (10**18);
        token.transfer(receiver, amount2 );
    }



    
}
