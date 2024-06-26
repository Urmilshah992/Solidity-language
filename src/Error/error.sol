// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract errort {
    //n error will undo all changes made to the state during a transaction.

    //You can throw an error by calling require, revert or assert.

    //require is used to validate inputs and conditions before execution.
    //revert is similar to require. See the code below for details.
    //assert is used to check for code that should never be false. Failing assertion probably means that there is a bug.
    //Use custom error to save gas.

    function testRequire(uint256 _i) public pure {
        //Require should be used to validate conditions such as:
        //- inputs
        // - conditions before execution
        //- return values from calls to other function
        require(_i > 10, "Inputs must be greater than 10");
    }

    function testRevert(uint256 _i) public pure {
        //revert is useful when the condition to check is complex.
        //This code does the exact same thing s the example above
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint256 public num;

    function testAssert() public view {
        //Assert should only be used to test for internal errors,
        //and to check invariants.

        //Here we assert that num is always equal to 0
        //since it is impossilble to update the value of num
        assert(num == 0);
    }

    //custom Errors
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function testCustomError(uint256 _withdrawamount) public view {
        uint256 bal = address(this).balance;
        if (bal < _withdrawamount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawamount});
        }
    }
}
