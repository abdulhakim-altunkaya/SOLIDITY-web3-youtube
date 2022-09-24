//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.9;

contract Flower {

    string public myFlower = "Rose";

    function changeWord() external {
        myFlower = "tulip";
    }

}