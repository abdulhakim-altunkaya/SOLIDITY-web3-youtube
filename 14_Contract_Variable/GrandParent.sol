//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7;

import "./Parent.sol";

contract GrandParent {

    //here do not forget to change below address with your parent contract address
    Parent public parentContract = Parent(0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99);

    function changeState(string memory word) external {
        parentContract.change(word);
    }

}