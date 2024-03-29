// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//Events allow logging to the Ethereum blockchain. someuse cases for events are;
// listening for events and updating user interface
// Acheap from of storage

contract events {
    //Event declaration
    //up to 3 parameters can be indexed.
    //indexed parameters helps you filter the logs by the indexed parameter

    event log(address indexed sender, string message);
    event Anotherlog();

    function test() public {
        emit log(msg.sender, "Hello World");
        emit log(msg.sender, "Hello EVM!");
        emit Anotherlog();
    }
}
