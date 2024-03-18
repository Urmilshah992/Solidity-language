// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract operators {
    // airthmatic operators are
    // "+" = add two numbers
    // "-" = minus two numbers
    // "/" = Divide two numbers
    // "*" = Multi two numbers
    // "%" = reminder will be given
    uint256 public a = 10;
    uint256 public b = 5;

    function addition() public view returns (uint256) {
        return a + b;
    }

    function subtraction() public view returns (uint256) {
        return a - b;
    }

    function multiplication() public view returns (uint256) {
        return a * b;
    }

    function divideation() public view returns (uint256) {
        return a / b;
    }

    function modulo() public view returns (uint256) {
        return a % b;
    }
}
