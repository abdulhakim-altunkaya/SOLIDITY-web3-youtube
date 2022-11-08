//SPDX-License-Identifier: MIT

pragma solidity >=0.8.10;

contract KeyValue {

    uint public myNum = 8;
    string public myWord = "apple";
    bool public isSomething = true;

    function changeValues(uint _number, string memory _word, bool _status) public {
        myNum = _number;
        myWord = _word;
        isSomething = _status;
    }


    function call1() external {
        changeValues(88, "orange", true);
    }

    function call2() external {
        changeValues({_word:"banana", _status: false, _number: 5555 });
    }

    
}
