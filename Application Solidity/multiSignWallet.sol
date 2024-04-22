// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

//Let's create an multi -sig wallet. Here are the specification
/** The wallet owners can
 *
 * submit a transaction
 * approve and revoke approval of pending transactions
 * anyone can execute a transaction after enough owners has approved it.
 *
 */

contract MultiSignWallet {
    event Deposit(address indexed sender, uint256 amount, uint256 balance);
    event submitTranscation(
        address indexed owner,
        uint256 indexed txIndex,
        address indexed to,
        uint256 value,
        bytes data
    );
    event ConfirmTransaction(address indexed owner, uint256 indexed txIndex);
    event RevokeConfirmation(address indexed owner, uint256 indexed txIndex);
    event ExecuteTransaction(address indexed owner, uint256 indexed txIndex);

    address[] public owners;
    mapping(address => bool) public isOwner;
    uint256 public numConfirmationRequired;
    struct Transaction {
        address to;
        uint256 value;
        bytes data;
        bool executed;
        uint256 numConfirmation;
    }
    //mapping from tx index => owner =>bool
    mapping(uint256 => mapping(address => bool)) isconfirmed;
    Transaction[] public transactions;

    //modifier

    //constructor
    constructor(address[] memory _owners, uint256 _numConfirmationRequired) {
        require(_owners.length > 0, "owners required");
        require(
            _numConfirmationRequired > 0 &&
                _numConfirmationRequired <= _owners.length,
            " Invalid number of required confirmations"
        );

        for (uint256 i = 0; i < _owners.length; i++) {
            address owner = _owners[i];
            require(owner != address(0), "invalid owner");
            require(!isOwner[owner], "owner not unique");
            isOwner[owner] = true;
            owners.push(owner);
        }
    }
}
