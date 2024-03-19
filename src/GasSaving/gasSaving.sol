// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract gasSaving {
    //Constants are variables that cannot be modified.
    //Their value is hard coded and using constants can save gas cos

    //
    uint256 public constant b = 100;
    uint256 public immutable a;
}
