//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7;

contract Campaign {

    mapping(address => uint) public donorsMapping;
    address[] public donorsArray;

    // ACCOUNT --> CONTRACT
    function addDonor() external payable {
        donorsMapping[msg.sender] = msg.value;
        donorsArray.push(msg.sender);
    }

    //CONTRACT --> ACCOUNT
    function withdrawAll() external {
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success, "failed");

        for(uint i = 0; i<donorsArray.length; i++) {
            donorsMapping[donorsArray[i]] = 0;
        }

        delete donorsArray;
    }

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }

    function getArrayLength() external view returns(uint) {
        return donorsArray.length;
    }


}