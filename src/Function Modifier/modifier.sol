// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Modifier {
    //Modifiers are code that can be run before and / or after a function call.

    //Modifiers can be used to:

    //Restrict access
    //Validate inputs
    //Guard against reentrancy hack

    address public owner;
    uint256 public x = 10;
    bool public locked;

    constructor() {
        //set the transaction sender as the ownwer of the contract.
        owner = msg.sender;
    }

    //modifer to check that the caller is the owner of the contract
    modifier onlyowner() {
        require(msg.sender == owner, "not owner");
        //Underscroe is special character only used inside
        //a Function modifier and it tells Solidity to
        //execute the rest of the code.

        _;
    }

    //modifier can take input. this modifier checks that the
    //address passed in is not the zero address.

    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not Valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyowner validAddress(_newOwner) {
        owner = _newOwner;
    }

    //Modifier can be called before and/or after a function
    //This modifier prevents a function from being called while
    //it is still executing

    modifier noReentrancy() {
        require(!locked, "Noreentrancy");
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint256 i) public noReentrancy {
        x -= i;
        if (i > 1) {
            decrement(i - 1);
        }
    }
}
