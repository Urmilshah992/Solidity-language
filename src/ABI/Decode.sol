// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

/**
 * a.biencode encodes data into bytes
 * abi.decode decodes data back to data.
 */
contract AbiDecode {
    struct Mystruct {
        string name;
        uint256[2] nums;
    }

    function encode(uint256 x, address addr, uint256[] calldata arr, Mystruct calldata mystruct)
        external
        pure
        returns (bytes memory)
    {
        bytes memory a = abi.encode(x, addr, arr, mystruct);
        return a;
    }

    function decode(bytes calldata data)
        external
        pure
        returns (uint256 x, address addr, uint256[] memory arr, Mystruct memory mystruct)
    {
        abi.decode(data, (uint256, address, uint256[], Mystruct));
    }
}
