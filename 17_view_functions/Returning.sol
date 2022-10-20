//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.10;

contract Returning {
    

    //DIFFERENT VIEW FUNCTIONS
    function getNum1(uint a) external pure returns(uint) {
        uint myNumber = a + 3;
        return myNumber;
    }

    //this is cheaper when executed
    function getNum2(uint a) external pure returns(uint myNumber) {
        myNumber = a + 3;
    }




}