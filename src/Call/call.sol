// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

/* Call is a low level function to interact with other contracts.
This is the recommended method to use when you are just sending ether via calling the fallback function.

However it is the recommend way to call existing functions

Few steps why low leve cll is recommended
1)Reverts are not bubbled up
2)Types checks are bypassed
3)Function existence checks are omitted.
           */

contract Receiver {
    event Received(address caller, uint256 amount, string message);

    receive() external payable {}

    fallback() external payable {
        emit Received(msg.sender, msg.value, "fallback was called");
    }

    function foo(
        string memory _message,
        uint256 _x
    ) public payable returns (uint256) {
        emit Received(msg.sender, msg.value, _message);
        return _x + 1;
    }
}

contract Caller {
    event Response(bool success, bytes data);

    /* lets imagine that contract Caller does not have the source code for the
    contract receiver, but we do know the address of contract Receiver and the function to call.
    */

    function testCallFoo(address payable _addr) public payable {
        //you can send ether and Sepcify a custom gas amount
        (bool success, bytes memory data) = _addr.call{
            value: msg.value,
            gas: 5000
        }(abi.encodeWithSignature("foo(string,uint256)", "call foo", 123));
        emit Response(success, data);
    }

    //calling a function that does not exist triggers the fallback function
    function testCallDoesNotExit(address payable _addr) public payable {
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("doesNotExist()")
        );
        emit Response(success, data);
    }
}
