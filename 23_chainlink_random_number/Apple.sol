// SPDX-License-Identifier: MIT
// An example of a consumer contract that relies on a subscription for funding.
pragma solidity ^0.8.7;

import "./VRFv2Consumer.sol";

contract Apple {

    VRFv2Consumer public contractA;

    function setContract(address _addressA) external {
        contractA = VRFv2Consumer(_addressA);
    }

    function createRandomValue() external {
        contractA.requestRandomWords();
    }


    function getRequestId() external view returns(uint){
        return contractA.lastRequestId();
    }

    function getRandomValues(uint _index) external view returns(bool fulfilled, uint256[] memory randomWords) {
        (fulfilled, randomWords) = contractA.getRequestStatus(_index);
    }

    function getRandomNumber(uint _index) external view returns(uint) {
        (, uint[] memory randomWords) = contractA.getRequestStatus(_index);
        return randomWords[0];
    }
    function getMod(uint _index) external view returns(uint) {
        (, uint[] memory randomWords) = contractA.getRequestStatus(_index);
        return randomWords[0] % 100;
    }

    /*
    

1) uint requestId -- produce requestId (uint), somewhere 80 chars long
2) uint[] requestIds -- create an array and add above value to it.
3) uint lastRequestId -- display last element of above array

4) RequestStatus -- create a struct variable and store following values:
    a- uint - random value or values (at thiss stage it will be empty)
    b- bool - does requestId exists?
    c- bool - iis request successful?

5) push the above variable inside mapping below
mapping(uint => RequestStatus) public s_requests;

6) create the random value/values and save it inside the mapping above
by calling the fulfillRandomWords() function

7) After step 6, we have random value/values.
*/
}