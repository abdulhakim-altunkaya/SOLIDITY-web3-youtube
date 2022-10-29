// SPDX-License-Identifier: MIT

pragma solidity >=0.8.10;

contract WhiteList {
    //defining an owner
    address public owner;
    constructor() {
        owner = msg.sender;
    }
    error NotOwner(string message, address caller);
    modifier onlyOwner() {
        if(msg.sender != owner) {
            revert NotOwner("you are not owner", msg.sender);
        }
        _;
    }

    //create a white list mapping
    mapping(address => bool) internal isWhiteListed;

    //add remove users, onlyOwner
    function addUser(address _newUser) external onlyOwner {
        isWhiteListed[_newUser] = true;
    }
    function removeUser(address _newUser) external onlyOwner {
        isWhiteListed[_newUser] = false;
    }

    //check status, public
    function check() external view returns(string memory) {
        if(isWhiteListed[msg.sender] == true) {
            return "you are a member my good sir";
        } else {
            return "hey you, you are not a member";
        }
    }

    //special function, only members
    modifier onlyMembers() {
        require(isWhiteListed[msg.sender] == true, "you are not member");
        _;
    }
    function special() external view onlyMembers returns(string memory) {
        return "Very special password is: apple";
    }




}