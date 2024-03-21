// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "/root/Solidity/Solidity-language/lib/forge-std/src/Test.sol";
import {helloworld} from "../src/helloworld.sol";

contract testhellow is Test {
    helloworld public Helloworld;

    function setUP() external returns (helloworld) {
        Helloworld = new helloworld();
        return Helloworld;
    }
}
