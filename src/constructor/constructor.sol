// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract constructore {
    uint public x;
    uint public y;
    address public owner;
    uint256 public at_time;

    constructor(uint256 _x, uint256 _y, uint256 _at_time) {
        _x = x;
        _y = y;
        _at_time = at_time;
        owner = msg.sender;
    }
}
