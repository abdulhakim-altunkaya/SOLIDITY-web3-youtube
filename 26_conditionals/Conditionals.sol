//SPDX-License-Identifier: MIT

pragma solidity >= 0.8.10;

contract Conditionals {

    // OR OPERATOR:  ||
    // At least one condition must be true
    function get1(uint _number) external pure returns(uint) {
        require(_number > 100 || _number < 10, "not in range");
        return _number;
    }

    //AND OPERATOR: &&
    //Both conditions must be true
    function get2(uint _number) external pure returns(uint) {
        require(_number > 10 && _number < 20, "not in range");
        return _number;
    }

    //OR in Return
    function get3(uint _number) external pure returns(bool) {
        return _number > 100 || _number < 10;
    }

    //AND in Return
    function get4(uint _number) external pure returns(bool) {
        return _number > 10 && _number < 20;
    }

    //SAME FUNCTION ABOVE WITH IF
    function get5(uint _number) external pure returns(bool) {
        if(_number > 10 && _number < 20) {
            return true;
        } else {
            return false;
        }
    }

}