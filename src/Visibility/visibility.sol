// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract visibility1 {
    //There are 4 types of visibilty in Solidity
    // 1)public:-outside,inside,derived,other
    // 2)external:-outside,derived,other     :- Not Possible inside call
    // 3)Internal :- inside,derived           :-Not Possible outside & other call
    // 4) Private:- Only inside

    //above all visibilty applyied in state variable or functions of the contract..
    uint256 public a = 50;

    function publicF() public view returns (uint256) {
        return a;
    }

    function externalF() external view returns (uint256) {
        return a;
    }

    function internalF() internal view returns (uint256) {
        return a;
    }

    function privateF() private view returns (uint256) {
        return a;
    }
}

//contract visibility1 is inherit in contract 2
//so, as per our visibilty guidelines only 3 function inherit below.
// 1)public,External, Internal
// if we inherit in deffernet file then only 2 functions are inherit. which is public and External
contract visibility2 is visibility1 {
    //public
    //external
    //internal
    //private is not allowed to inherit in different contract.
}
