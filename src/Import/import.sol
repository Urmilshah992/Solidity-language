// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;
//Import Fool.sol from current directory
import "./Foo.sol";

//import{symbol1, symbol2} from "filename";
import {Unauthorized, add as func, Point} from "./Foo.sol";

contract Import {
    //Initialize Foo.sol
    Foo public foo = new Foo();

    //Test Fool.sol by getting it's name
    function getName() public view returns (string memory) {
        return foo.name();
    }
}
