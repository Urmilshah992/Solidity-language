// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract enumC {
    //Solidity supports enumerables and they are useful to model choice and keep track of state.
    //Enums can be declared outside of a contract.

    enum status {
        pending,
        shipped,
        Accepted,
        Rejected,
        Canceled
    }

    // Return uint
    //pending - 0
    // shipped -1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    status public Status;

    function set(status _status) public {
        Status = _status;
    }

    function update() public {
        Status = status.Canceled;
    }

    function rest() public {
        delete Status;
    }
}
