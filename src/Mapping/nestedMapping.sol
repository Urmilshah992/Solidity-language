// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract NestedMappping {
    mapping(string => mapping(uint256 => string)) public name;

    function addbook(string memory deparmentname, string memory bookName, uint256 bookNo) public {
        name[deparmentname][bookNo] = bookName;
    }

    function getter(string memory deparmentname, uint256 bookNo) public view returns (string memory) {
        return name[deparmentname][bookNo];
    }
}
