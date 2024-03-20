// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract Token {

    string public tokenName;
    uint public tokenCap;

    constructor(string memory _name, uint _cap) {
        tokenName = _name;
        tokenCap = _cap;
    } 
    
}
