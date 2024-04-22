// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

//Accesssing private Data

//Vulnerability

/**
 * All Data on a smart contract can be read.
 * Let's see how we can read private data. In the process you will lear how Solidity stores state variables.
 *
 *
 * Use Truffle console
 * Storage
 * 2** 256 slots
 * Data is stored sequentially in the order of declaration
 * storage is optimized to save space. If neighboring variables fit in a single 32 bytes, then they are packed into the same slot, staring from the right
 *
 */
contract Valut {
    //salt 0
    uint256 public count = 123; //32bytes
    //slot 1
    address public owner = msg.sender; //20bytes
    bool public isTrue = true; //1 bytes
    uint16 public u16 = 31; //2 byte2
    //slot 2
    bytes32 private password;
    //constant do not use storage
    uint256 public constant someConst = 123;
    //slot 3, 4, 5 (one for each array elements)
    bytes32[3] public data;

    struct User {
        uint256 id;
        bytes32 password;
    }

    //slot6 -length of array
    //staring from slot hash(6) -array elements
    //slot where array element is stored  = keccak256(slot) + (index*elementSize)
    //where slot = 6 and elementeSize = 2 (1 (uint) + 1 (bytes32))
}
