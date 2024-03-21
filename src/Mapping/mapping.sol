// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//mapping syntax :- mapping (key=> value) storeValue;
//you cannot put key value as like Struct, enum, mapping, Daynamic Sized array, State variable, Contract

contract totoalTx {
    uint public totalTX = 0;
    mapping(uint => address) somevalue;

    function totaltxget() public returns (uint256) {
        somevalue[totalTX] = address(
            0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
        );
        return totalTX++;
    }
}
