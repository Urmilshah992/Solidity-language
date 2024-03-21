// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "/root/Solidity/Solidity-language/lib/forge-std/src/Script.sol";
import {helloworld} from "../src/helloworld.sol";

contract deployhellow is Script {
    function run() external returns (helloworld) {
        vm.startBroadcast();
        helloworld Helloworld = new helloworld();
        vm.stopBroadcast();
        return Helloworld;
    }
}
