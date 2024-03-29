// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//Here is a simple contrac that you can get, increment and decrement the count store in this contract
contract myfirstapp {
    uint256 public count;

    //get the count value which is by defult is 0;
    function get() public view returns (uint256) {
        return count;
    }

    //everytime function call at that time increase 1 value in the count variable.
    function increment() public {
        count += 1;
    }

    //everytime function call ,at that time decrease 1 value un the count variable.

    function decrease() public {
        require(count > 0, "Count is 0  so not valid");
        count -= 1;
    }
}
