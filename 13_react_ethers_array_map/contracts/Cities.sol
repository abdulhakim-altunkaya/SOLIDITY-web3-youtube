//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.1;

contract Cities {

    string[] internal myCities = ["Mardin", "Stockholm", "Jakarta", "Braga"];

    function getArray() external view returns(string[] memory){
        return myCities;
    }

}