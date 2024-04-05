// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//You can interact with other contracts by decalaring an Interface.
//Interface

//1) Cannot have any function implemented.
//2) Can inherit from other function
//3) All declared function must be external
//4) Cannot declared constructor
//5) Cannot declared state variable.

contract counter {
    uint256 public count;

    function increament() external {
        count += 1;
    }
}

interface Icounter {
    function count() external view returns (uint256);

    function increment() external;
}

contract MyContract {
    counter public Counter;

    function incrementcounter(address _counter) external {
        Counter = new counter();
        Icounter(_counter).increment();
        Counter.count;
    }

    function getcount(address _counter) external view returns (uint256) {
        return Icounter(_counter).count();
    }
}

// Second Example

interface calculater {
    function getResult() external view returns (uint256);
}

contract test is calculater {
    function getResult() external pure returns (uint256) {
        uint256 a = 1;
        uint256 b = 2;
        uint256 result = a + b;
        return result;
    }
}
