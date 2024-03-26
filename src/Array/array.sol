// SPDX-License-Identifier: MIt
pragma solidity ^0.8.24;

contract array {
    //There are two types of array
    //1) fix sized array
    //2) dynamic sized array.

    uint256[] public dynamicarr;
    uint256[5] public staticarr;
    string[5] public strarr;
    address[10] addressarr;

    uint[] public fixValuearr = [1, 2, 3, 4, 5];

    function adddynamicvalue(uint256 index) public {
        dynamicarr.push(index);
    }
}
