// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

interface IERC20 {
    function transfer(address, uint256) external;
}

contract Token {
    function transfer(address, uint256) external {}
}

contract AbiEncode {
    string public a = "Urmil";

    function test(address _contract, bytes calldata data) external {
        (bool ok, ) = _contract.call(data);
        require(ok, "Failed Call Function");
    }

    function encodeWithSignature(
        address to,
        uint256 amount
    ) external pure returns (bytes memory) {
        //typo is not checked - "transfer(address,uint)"
        return abi.encodeWithSignature("transfer(address,uint256)", to, amount);
    }

    function encodeWithSelator(
        address to,
        uint256 amount
    ) external pure returns (bytes memory) {
        //Type is not checked (IERC20.transfer.selector,to ,amount);
    }

    function encodeCall(
        address to,
        uint256 amount
    ) external pure returns (bytes memory) {
        //Typo and type errors will not complie
        return abi.encodeCall(IERC20.transfer, (to, amount));
    }

    function encodePackedCall() external view returns (bytes memory) {
        bytes memory x = abi.encodePacked(a);
        return x;
    }
}
