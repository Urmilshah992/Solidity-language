// primitive data types = fixed value and same data type. inshort one variable has some define value.
// 1)boolen
// 2)uint256
// 3)address
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract dataTypes {
    uint256 private number; //unsigned integer declare at state variable.
    address public owner; // in address always use hex formate for the address of the owner.
    bool public status; //boolen type always given true/false. In,defult state is false.

    constructor() {
        // constructor is used in one time in the contract , it will use at deploy time. afte the contract deploy we cant change the any kind of the function.
        owner = msg.sender;
    }

    function orginal() public {
        require(
            owner == 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266,
            "Not owner"
        );
        number = 100;
        status = true;
    }
}
