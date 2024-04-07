// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

//Language used for assembly is called Yul

contract AssemblyVariable {
    function yul_let() public pure returns (uint256 z) {
        assembly {
            //Local Variable
            let x := 123
            z := 456
        }
    }
}
