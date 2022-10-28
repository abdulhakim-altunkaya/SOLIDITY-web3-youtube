//SPDX-License-Identifier: MIT

pragma solidity >=0.8.10;

contract DataLocations {
    //STORAGE
    uint[] internal myNumbers = [8, 7, 6];

    function change1() external {
        myNumbers[1] = 555;
    }

    function change2() external {
        uint[] storage xxx = myNumbers;
        xxx[1] = 444;
    }

    function getA() external view returns(uint[] memory) {
        return myNumbers;
    }

    //MEMORY
    function get1(string memory _name) external pure returns(string memory) {
        return _name;
    }
    //CALLDATA
    function get2(string calldata _name) external pure returns(string calldata) {
        return _name;
    }
    //STACK
    function get3(uint myNumber) external pure returns(uint) {
        return myNumber;
    }


/*
****STORAGE****
Storage variables are stored on the blockchain.
All variables that are outside functions are storage variables. 
Inside functions sometimes there can be "storage pointer variables" not "storage variables".
They can be updated/modified.
They are expensive.

****MEMORY****
It is data location for function parameters and also function implementation
Which means, you can see a memory variable inside function parameters and also inside function implementation.
Memory variables are mutable/modifiable
Memory variables are also non-persistant. They are deleted when function execution finishes.
Cheaper than Storage.

****CALLDATA****
It is data location for function parameters only
Which means you can see a calldata variable only in function parameters.
They are immutable/non-modifiable 
They are non-persistant, they are deleted when function execution finishes.
Cheaper than Memory.

****STACK****
Stack is also data location for storing small local and value type variables. 
Function execution space. Variable values are entering in and exiting out. 
They are mutable/modifiable
They are non-persistant, they are deleted when function execution finishes.
Cheapers to use.

FURTHER READING:
Slots
Assignments from one another
Reference type/value type

*/
}