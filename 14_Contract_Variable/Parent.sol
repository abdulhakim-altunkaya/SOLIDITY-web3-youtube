//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7;

import "./Child.sol";

contract Parent {

    //FIRST PART
    Child public childContract;

    constructor() {
        childContract = new Child("Mardin");
    }

    function getChildData() external view returns(address) {
        return childContract.owner();
    }

    //SECOND PART
    string public greetings = "Hello";
    function change(string memory x) external {
        greetings = x;
    }

}