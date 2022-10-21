//SPDX-License-Identifier: MIT
pragma solidity >=0.8.10;

contract Apple {

    uint public myNumber;

    function getNumber(uint n) external pure returns(uint) {
        return n;
    }

    /*WRONG WAY-1
    function setNumber1(uint a) external {
        myNumber = getNumber(a);
    }
    */
    /*WRONG WAY-2
    function setNumber3(uint a) external {
        myNumber = address(this).getNumber(a);
    }
    */

    //RIGHT WAY -1: this
    function setNumber2(uint b) external {
        myNumber = this.getNumber(b);
    }

    //RIGHT WAY - 2: "contract variables"
    Apple public newContract;
    function set(address contractAddress) external {
        newContract = Apple(contractAddress);
    }
    function setNumber4(uint c) external {
        myNumber = newContract.getNumber(c);
    }

}