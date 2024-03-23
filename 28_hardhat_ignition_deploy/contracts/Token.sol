// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract Token {
    uint public tokenCap;
    string public tokenName;


    constructor(uint _cap, string memory _name) payable {
        tokenCap = _cap;
        tokenName = _name;
    }

}
