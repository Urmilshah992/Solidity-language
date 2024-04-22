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
}
