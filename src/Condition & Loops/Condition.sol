// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Condition1 {
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

contract Condition2 {
    //for , while & do while loop.....
    uint256 count;
    uint256[] arr;

    //for loop
    function oneTohundred(uint256 b) public returns (uint256) {
        for (uint256 i = 1; i < b; i++) {
            count += i;
        }
        return count;
    }

    //do ...while loop
    function hundred() public returns (uint256[] memory) {
        uint256 j = 1;
        do {
            arr[j] = j;
            j++;
        } while (j < 100);
        return arr;
    }
}
