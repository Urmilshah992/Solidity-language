// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Condition {
    //if,   if.....else, if....if else...else
    function greterThan(uint256 a) public pure returns (string memory) {
        string memory x;
        if (a > 10) {
            x = "A is greterthan 10";
        }
        return x;
    }

    function lessThan(uint256 a) public pure returns (string memory) {
        string memory y;
        if (a < 10) {
            y = "B is less than 10";
        }
        return y;
    }

    function equalTo(uint256 a) public pure returns (string memory) {
        string memory z;
        if (a == 10) {
            z = "B is less than 10";
        }
        return z;
    }
}
