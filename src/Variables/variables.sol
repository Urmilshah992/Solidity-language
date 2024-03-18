// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract variables {
    //state variable stored in utside the function
    uint256 private a = 50;

    function localVar() public pure returns (uint8) {
        uint8 b = 50;
        return b;

        //local variable are always call inside the function and this is not stored data. it is tempory
    }

    function globalvariable() public view returns (uint256) {
        return block.timestamp;

        //this is global variable
    }
}
