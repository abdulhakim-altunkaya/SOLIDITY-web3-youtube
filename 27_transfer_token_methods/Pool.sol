// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/*
    transfer(recipient, amount)
    approve(spender, amount)
    transferFrom(sender, recipient, amount)
    _transfer(sender, recipient, amount)
    _approve(owner, spender, amount)
*/

contract Pool {

    IERC20 public tokenA;

    function setToken(address _tokenAddress) external {
        tokenA = IERC20(_tokenAddress);
    }
    //ACCOUNT --> CONTRACT
    function deposit(uint _amount) external {
        tokenA.transferFrom(msg.sender, address(this), _amount*(10**18));
    }

    //CONTRACT --> ACCOUNT
    function withdraw(uint _amount) external {
        tokenA.transfer(msg.sender, _amount*(10**18));
    }

    /*
    ERRORS -- DEPOSIT
    1. "transfer" is a special method defined in IERC20. So, we must use IERC20.
        function deposit(uint _amount) external {
            transfer(address(this), _amount);
        }


    2. "tokenContract.transfer" transfers tokens from CONTRACT to CONTRACT
        function deposit(uint _amount) external {
            tokenA.transfer(address(this), _amount);
        }
    3. "tokenContract._transfer" will not work because "_transfer" is an ERC20 method 
    but it is not defined in IERC20.
        function deposit(uint _amount) external {
            _transfer(msg.sender, address(this), _amount);
        }
    4. "_transfer" is an ERC20 method. And as we are not inheriting from ERC20, we cannot
    use ERC20 methods directly.
        function deposit(uint _amount) external {
            tokenA._transfer(msg.sender, address(this), _amount);
        }
    5. "transferFrom" is a special method defined in IERC20. So, we must use IERC20.
        function deposit(uint _amount) external {
            transferFrom(msg.sender, address(this), _amount);
        }
    6. "tokenContract.transferFrom" we can use it, it is the correct way, but we cannot use 
    it without "approve". Otherwise everybody would be withdrawing from one another.
        function deposit(uint _amount) external {
            tokenA.transferFrom(msg.sender, address(this), _amount);
        }
    7. "approve
        tokenContract.transferFrom" 
    It will give error because "approve" is a special method defined in IERC20. So, we must use IERC20.
        function deposit(uint _amount) external {
            approve(address(this), _amount);
            tokenA.transferFrom(msg.sender, address(this), _amount);
        }
    8. "tokenContract.approve
        tokenContract.transferFrom" 
    It will give error because "approve" cannot differentiate between function caller and token sender.
    So it will approve THIS Contract to withdraw tokens of THIS Contract,
    It will not approve THIS Contract to withdraw tokens of OUR METAMASK ACCOUNT.
        function deposit(uint _amount) external {
            tokenA.approve(address(this), _amount);
            tokenA.transferFrom(msg.sender, address(this), _amount);
        }
    9. "tokenContract._approve
        tokenContract.transferFrom" 
    "_approve" is an ERC20 method, it is not IERC20 method. So, we cannot use it here.
        function deposit(uint _amount) external {
            _approve(msg.sender, address(this), _amount);
            tokenA.transferFrom(msg.sender, address(this), _amount);
        }
    10."_approve
       tokenContract.transferFrom" 
    "_approve" is an ERC20 method. And as we are not inheriting from ERC20, we cannot
    use ERC20 methods directly.
        function deposit(uint _amount) external {
            tokenA._approve(msg.sender, address(this), _amount);
            tokenA.transferFrom(msg.sender, address(this), _amount);
        }
    ERRORS -- WITHDRAW

    1. "tokenContract._transfer" will not work because "_transfer" is an ERC20 method 
    but it is not defined in IERC20.
        function withdraw(uint _amount) external {
            _transfer(address(this), msg.sender, _amount);
        }
    2. "_transfer" is an ERC20 method. And as we are not inheriting from ERC20, we cannot
    use ERC20 methods directly.  
        function withdraw(uint _amount) external {
            tokenA._transfer(address(this), msg.sender, _amount);
        } 
    10. "approve" on Token Contract
        "tokenContract.transferFrom" Pool Contract

    It will not work because when we "approve" our Metamask account as spender, we also make
    our same Metamask account sender. It means we are sending from our Metamask account to our
    Metamask account.
        function withdraw(uint _amount) external {
            tokenA.transferFrom(address(this), msg.sender, _amount);
        }
    11. "_approve" function will not work either because of the same reasons as "_transfer".
    
    */
}
