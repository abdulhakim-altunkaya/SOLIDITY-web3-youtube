//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7;

contract Test9 {
    
    string internal flower = "rose";

    function getFlower() external view returns(string memory) {
        return flower;
    }

    function changeFlower(string memory _word) external {
        flower = _word;
    }
}