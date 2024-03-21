// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract pureandview {
    //state variable
    uint256 public a = 50;

    //view function is only use when you want to read state variable. Also you cannot edit that state variable.
    function viewstateV() public view returns (uint256) {
        return a;
    }

    //pure function is only use when you can not read any kind of state variable. or edit.
    function pureStateV(uint256 b) external pure returns (uint256) {
        uint256 _b;
        _b = b;
        return _b;
    }

    //if you want to edit the state variable then make sure you dont put view/pure function
    function editStateV() public returns (uint256) {
        a = 100;
        return a;
    }
}
