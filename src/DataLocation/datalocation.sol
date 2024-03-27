// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

//Variables are declared as either storage, memory or calldata to explicitly specify the location of the data.

//storage - variable is a state variable (store on blockchain)
//memory - variable is in memory and it exists while a function is being called
//calldata - special data location that contains function arguments

contract dataLocation {
    uint256[] public arr;
    mapping(uint256 => address) map;
    struct Mystruct {
        uint256 foo;
    }
    mapping(uint256 => Mystruct) myStructs;

    function f() public {
        //call _f with state variables
        _f(arr, map, myStructs[1]);

        //get a struct from a mapping
        Mystruct storage myStruct = myStructs[1];

        //create a struct in memory
        Mystruct memory myMemStruct = Mystruct(0);
    }

    function _f(
        uint256[] storage _arr,
        mapping(uint256 => address) storage _map,
        Mystruct storage _myStruct
    ) internal {
        //do somthing with strorage varables
    }
}
