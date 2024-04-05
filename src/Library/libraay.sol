// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

/**
 * Libraries are similar to contracts, but you can not decalre any state variable and you cant not send ether.
 * A library is embedded into the contract if all library functions are internal.
 * Otherwise the library must be deployed and then linked before the contract is deployed.
 *
 */
library Math {
    function squrt(uint256 y) internal pure returns (uint256 z) {
        if (y > 3) {
            z = y;
            uint256 x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        } else {
            z = 0;
        }
    }
}

contract Testmath {
    function testSquareRoot(uint256 x) public pure returns (uint256) {
        return Math.squrt(x);
    }
}

/**
 * Array function to delete element at index an re-organize the array
 * so that there are no gaps between the elements.
 */
library Array {
    function remove(uint256[] storage arr, uint256 index) public {
        //Move the lsast element into the place to delete
        require(arr.length > 0, "Cant remove from the empty array");
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

contract TestArray {
    using Array for uint256[];

    uint256[] public arr;

    function TestArrayRemove() public {
        for (uint256 i = 0; i < 3; i++) {
            arr.push();
        }
        arr.remove(1);

        assert(arr.length == 2);
        assert(arr[0] == 0);
        assert(arr[1] == 2);
    }
}
