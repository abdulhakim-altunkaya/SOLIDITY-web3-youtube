//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7;

contract Child {

    string public name;
    address public owner;

    constructor(string memory _word) {
        name = _word;
        owner = msg.sender;
    }

}