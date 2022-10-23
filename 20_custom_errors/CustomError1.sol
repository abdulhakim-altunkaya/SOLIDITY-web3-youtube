//SPDX-License-Identifier: MIT

pragma solidity  >=0.8.10;

/*
IF
IF & REVERT
IF & REVERT & CUSTOM ERROR
REQUIRE
ASSERT


CUSTOM ERRORS
1) are cheaper to deploy
2) allow us to pass dynamic data to the error message
3) can only be used with Revert statements.
4) their syntax is similar to "events"*/

contract CustomError1 {

    error NotOwner(string message, address caller);

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if(msg.sender != owner) {
            revert NotOwner("you are not owner", msg.sender);
        }
        _;
    }

    function getHello() external view onlyOwner returns(string memory) {
        return "Hello";
    }
 
}