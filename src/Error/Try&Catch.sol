// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

/**
 * Try and Catch can only catch errors from external function calls and contract creation
 * External contract used for try/catch example
 */
contract Foo {
    address public owner;

    constructor(address _owner) {
        require(_owner != address(0), "Invalid Address");
        assert(_owner != 0x0000000000000000000000000000000000000001);
        owner = _owner;
    }

    function myFunc(uint256 X) public pure returns (string memory) {
        require(X != 0, "require failed");
        return "my func was called";
    }
}

contract Bar {
    event Log(string message);
    event LogBytes(bytes data);

    Foo public foo;

    constructor() {
        //This Foo contract is used for example of try catch with external call
        foo = new Foo(msg.sender);
    }

    /**
     * Example of try/ catch with external call
     * tryCatchEternalcall(0) => Log ("External Call Failed");
     * tryCatchExternalcall(1) => Log ("my func was called");
     *
     */
    function tryCatchExternalCall(uint256 _i) public {
        try foo.myFunc(_i) returns (string memory res) {
            emit Log(res);
        } catch {
            emit Log("External call failed");
        }
    }

    /**
     * Example of try /Catch with contract creation
     * tryCatchNewContract(0x0000000000000000000000000000000000000000) => Log("invalid address")
     * tryCatchNewContract(0x0000000000000000000000000000000000000001) => LogBytes("")
     * tryCatchNewContract(0x0000000000000000000000000000000000000002) => Log("Foo Created")
     */
    function tryCatchNewContract(address _owner) public {
        try new Foo(_owner) returns (Foo foo) {
            //You can use variable foo here
            emit Log("Foo created");
        } catch Error(string memory reason) {
            //catch failing revert() and require()
            emit Log(reason);
        } catch (bytes memory reason) {
            //catch failing assert()
            emit LogBytes(reason);
        }
    }
}
