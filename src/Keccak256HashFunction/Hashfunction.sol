// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

/**
 * keccak256 computes the keccak-256 hash of the input
 * Some use Cases are:-
 * Creating a deterministic unique Id from a input
 * Commit Reveal Scheme
 * Compact cyptographic signature (by signing the hash instead of a larger input)
 */
contract HashFunction {
    function hash(string memory _text, uint256 _num, address _addr) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_text, _num, _addr));
    }

    /**
     * Example of hash collision
     * hash collision can occur when you pass more than one dynamic data type
     * to abi.encodePacked. In such case, you should use abi.encode instead.
     *
     */
    function collision(string memory _text, string memory _anothertext) public pure returns (bytes32) {
        /**
         * encodePacked(AAA, BBB) => AAABBB
         * encodePacked(AA,ABBB)  => AAABBB
         */
        return keccak256(abi.encodePacked(_text, _anothertext));
    }
}

contract GuessTheMagigWord {
    bytes32 public answer = 0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;

    //Magic Word is "Solidity"
    function guess(string memory _word) public view returns (bool) {
        return keccak256(abi.encodePacked(_word)) == answer;
    }
}
