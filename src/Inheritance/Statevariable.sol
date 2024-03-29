// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//unlike function state variable cannot be overrdden by re-declaring it the child contract.

contract A {
    string public name = " Contract A";

    function getName() public view returns (string memory) {
        return name;
    }
}

//Shadowing is disallowed in Solidity 0.6
//This will not compile
//contract B is A{
//  string public name = "Contract B"
// }

contract c is A {
    //this is the correct way to override inherited state variables.
    constructor() {
        name = "Contract C";
    }
}

// C.getname returns "Contract C"
