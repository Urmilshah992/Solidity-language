// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

//Parent contracts can be called directly, or by usin the keyword super.
//By using the keyword super, all of the immeediate parent contracts will be called.

/* Inheritance

        A
       / \
      B   C
      \   /
        D 
*/
contract A {
    event log(string meassage);

    //This is called event. You can emit events from your function
    //and they are logged into the transaction log.
    //In our case, this will be usefull for tracking function calls.
    function foo() public virtual {
        emit log("A.foo Called");
    }

    function bar() public virtual {
        emit log("A.bar call");
    }
}

contract B is A {
    function foo() public virtual override {
        emit log("B.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit log("B.bar called");
        super.bar();
    }
}

contract C is A {
    function foo() public virtual override {
        emit log("C.foo Called");
        A.foo();
    }

    function bar() public virtual override {
        emit log("C.bar called");
        super.bar();
    }
}

contract D is B, C {
    function foo() public override(B, C) {
        super.foo();
    }

    function bar() public override(B, C) {
        super.bar();
    }
}
