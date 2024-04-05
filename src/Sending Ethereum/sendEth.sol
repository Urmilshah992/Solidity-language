// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//How to send Eth?

//You can send Ehter to other contracts by
//1) transfer(2300gas,Throws Error)//
//2) send (2300 gas , returns bool)
//3) call(forward all gas or set gas, return bool)

//How to receive Ether?

// A contract receive ethe must have at least one of the functions below

//1)receive() external payable
//2)fallback() external payable

//receive() is called when msg.data is empty, otherwise fallback() is called.

//Which method should you use?

// call in combination with re-entrancy guard is the recommended method to use.

//Guard against re-entrancy by
//1)making all state chnges before calling other contracts
//2)using retrancy guard modifier

contract ReceiveEther {
    /*
    which function is called , fallback() or receive()?

                    send ether
                        |
                 msg.data is empty?
                      /   \
                    Yes    No   
        receive() Exists?  fallback()   
                  /     \   
                Yes     No 
                /         \
           receive()   fallback() */

    //function to receive ether. msg.data must be empty
    receive() external payable {}

    //fallback function is called when msg.data is not empty
    fallback() external payable {}

    function getBalcance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract SendEther {
    //1)Transfer method = syntex => _Address.transfer(msg.value)
    function sendViaTransfer(address payable _to) public payable {
        //This function no loger recommended for sending ether

        _to.transfer(msg.value);
    }

    //2) send Method = syntex => boo sent = _Address.send(msg.value);
    function sendViaSend(address payable _to) public payable {
        //Send returns a boolean value indication a success or failure
        //This function is not recomended for sending ethe
        bool sent = _to.send(msg.value);
        require(sent, "Failed to sent Ether ");
    }

    //3) Call Method = syntex = > (bool success, ) = _Address.call{value:balance}("");
    function sendViaCall(address payable _to) public payable {
        (bool success,) = _to.call{value: msg.value}("");
        require(success, "Filed to sent Ether");
    }
}
