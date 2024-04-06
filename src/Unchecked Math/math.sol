// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

/** overflow and inderflow of numbers in solidity 0.8 throw an error. This can be disabled by using unchecked
 * Disabling overflow/underflow check saves gas.
 */
contract Uncheckedmath {
    function add(uint256 x, uint256 y) external pure returns (uint256) {
        //22291 gas
        // return x+y;

        /**22103 gas
         *  unchecked{
            return x +y;
          }   */
        unchecked {
            return x + y;
        }
    }

    function sub(uint256 x, uint256 y) external pure returns (uint256) {
        //22329 gas
        // return x-y;

        /**22147 gas
         *  unchecked{
            return x +y;
          }   */
        unchecked {
            return x - y;
        }
    }
}
