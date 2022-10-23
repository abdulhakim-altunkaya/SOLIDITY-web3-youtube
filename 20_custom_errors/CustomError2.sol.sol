//SPDX-License-Identifier: MIT

pragma solidity  >=0.8.10;

//THIS IS NOT A CUSTOM ERROR CONTRACT. IT IS TO HELP YOU TO SEE 
//THE DIFFERENCE WITH REVERT & IF
contract CustomError2 {

    address public owner;
    
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        if(msg.sender != owner) {
            revert ("you are not owner");
        }
        _;
    }

    function getHello() external view onlyOwner returns(string memory) {
        return "Hello";
    }


}