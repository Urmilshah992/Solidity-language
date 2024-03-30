// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

//fallback is a speacial function that is executed either when
// 1) A function that does not exit is called or
// 2) ether is sent directlly to a contract but receive() does not exit or msg.data is not empty

//fallbck has a 2300 gas limit when called by transfer or send

contract Fallback {
    event Log(string func, uint256 gas);

    //fallback function must be decalred as external.

    fallback() external payable {
        //send / transfer (forwards 2300 gas to this fallback function)
        //call (forward all of the gas)
        emit Log("fallback", gasleft());
    }

    //Receive is variant of fallback that is triggered when msg.data is empty
}
