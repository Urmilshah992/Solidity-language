// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

contract A {
    uint256 public a;

    function setA(uint256 _a) public {
        a = _a;
    }
}

contract B {
    event datA(bytes);

    address public aAddress;
    uint256 public b;

    constructor(address _aAddress) {
        aAddress = _aAddress;
    }

    function setA(uint256 _a) public {
        (bool success, bytes memory result) = aAddress.delegatecall(abi.encodeWithSignature("setA(uint256)", _a));
        require(success, "delegatecall failed");
        emit datA(result);
    }
}
