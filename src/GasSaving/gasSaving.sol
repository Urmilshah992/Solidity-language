// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract gasSaving {
    //Constants are variables that cannot be modified.
    //Their value is hard coded and using constants can save gas cost

    uint256 public constant b = 100;
    uint256 public immutable a;

    //Immutable variables are like constants. Values of immutable variables can be set inside the constructor but cannot be modified afterwards.

    constructor() {
        a = 100;
    }
}
