// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

//Vulnerability

//Hinding Malicious Code with External Contract

//In Solidity any address can be casted into specific contrct, eveen is the contract at address is not the one beinh casted.

contract Foo {
    Bar bar;

    constructor(address _bar) {
        bar = Bar(_bar);
    }

    function callBar() public {
        bar.log();
    }
}

contract Bar {
    event Log(string message);

    function log() public {
        emit Log("Bar was called");
    }
}

//This code is hidden in a separate File

contract Mal {
    event Log(string message);

    //function () external{
    //emit Log ("Mal was called");

    // Actually we can execute the same exploit even if this function does not exit by using the fallback

    function log() public {
        emit Log("Mal Was called");
    }
}
