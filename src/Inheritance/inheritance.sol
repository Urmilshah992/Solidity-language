// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//Solidity supports multiple inheritance.Contracts cn inherit other contract by using the is keyword.
//function that is going to be overrridden by a child contract must be decalred as virtual.
//Functin tha is going to override a parent function must use the keyword override.

// Order of inheritance is important.
//You have to list the parent contracts in the order from most base like to most derived.

/* Graph of inheritance

      A
     / \
    B   C
   / \  /
  F  D, E  


  */

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

contract B is A {
    //override A.foo()

    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    //override A.foo()

    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

//contract cn inherit fro multiple parent contracts.
//When a function is called that is defined multiple times in
//differnet contracts, parent contracts are searched from
//right to lefe, and in depth-first manner

contract D is B, C {
    // D.foo() returns "C"
    // since C is the right most parent contract with function foo()
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}

contract E is C, B {
    //E.foo() returns "B"
    //since B is the right most parent contract with function foo()
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}

//inheritance must be ordered from "Most base Like" to "most derived"
//swapping the order of A and B will throw a compliation erro.

contract F is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        return super.foo();
    }
}
