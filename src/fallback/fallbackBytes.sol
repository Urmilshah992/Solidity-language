// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

//TestFallbackInput Output => fallbackInput Output => Counter

contract FallbackInputOutput {
    address immutable target;

    constructor(address _traget) {
        target = _traget;
    }

    fallback(bytes calldata data) external payable returns (bytes memory) {
        (bool ok, bytes memory res) = target.call{value: msg.value}(data);
        require(ok, "call failed");
        return res;
    }
}

contract Counter {
    uint256 public count;

    function get() external view returns (uint256) {
        return count;
    }

    function inc() external returns (uint256) {
        count += 1;
        return count;
    }
}

contract TestFallbackInputOutput {
    event log(bytes res);

    function test(address _fallback, bytes calldata data) external {
        (bool ok, bytes memory res) = _fallback.call(data);
        require(ok, "call failed");
        emit log(res);
    }

    function getTestData() external pure returns (bytes memory, bytes memory) {
        return (abi.encodeCall(Counter.get, ()), abi.encodeCall(Counter.inc, ()));
    }
}
