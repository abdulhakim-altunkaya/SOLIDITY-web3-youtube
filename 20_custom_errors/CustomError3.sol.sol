//SPDX-License-Identifier: MIT

pragma solidity  >=0.8.10;

//THIS IS NOT A CUSTOM ERROR CONTRACT. IT IS TO HELP YOU TO SEE 
//THE DIFFERENCE WITH REQUIRE
contract CustomError3 {

    address public owner;
    
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "you are not owner");
        _;
    }

    function getHello() external view onlyOwner returns(string memory) {
        return "Hello";
    }


}