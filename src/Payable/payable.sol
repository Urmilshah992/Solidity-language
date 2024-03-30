// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

//function and addresses decalred payable cn receive ether into the contract.

contract Payable {
    //payable address can send ether via transfer or send
    address payable public owner;

    //payable constructor can receive ether

    constructor() payable {
        owner = payable(msg.sender);
    }

    //function to deposit ether into this contract
    //call this function along with some ether
    //the balance of this contrat will be automatically updated

    function deposit() public payable {}

    //call this function along with some ether
    //the function will throw an error since this function is not payable
    function notpayable() public {}

    //function to withdraw all ether stroed from this contract
    function withdraw() public {
        //get the amount of ether stroed in this contract
        uint256 amount = address(this).balance;

        //send all eth to owner
        (bool Success, ) = owner.call{value: amount}("");
        require(Success, "Not owner");
    }

    //if you want transfer this amount to different account
    function transferTo(address payable _no, uint256 _amount) public {
        // not that to is payable
        (bool success, ) = _no.call{value: _amount}("");
        require(success, "not owner");
    }
}
