// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract readwrite {
    uint256 a;
    uint256 b = 100;

    function read() public view returns (uint256) {
        return b;
    }

    function write(uint256 _a) public returns (uint256) {
        a = _a * 100;
        return a;
    }
}
