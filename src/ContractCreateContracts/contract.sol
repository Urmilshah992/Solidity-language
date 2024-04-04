// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

/** contract can be created by other contracts using the new keyword
 * since 0.8.0, new keyword supports create feture by specifying salt options.
 */

contract Car {
    address public owner;
    string public model;
    address public carAddr;

    constructor(address _owner, string memory _model) payable {
        owner = _owner;
        model = _model;
        carAddr = address(this);
    }
}

contract CarFacotry {
    Car[] public cars;

    function create(address _owner, string memory _model) public {
        Car car = new Car(_owner, _model);
        cars.push(car);
    }

    function create2(
        address _owner,
        string memory _model,
        bytes32 _salt
    ) public {
        Car car = new Car{salt: _salt}(_owner, _model);
        cars.push(car);
    }

    function createandSendEth(
        address _owner,
        string memory _model
    ) public payable {
        Car car = new Car{value: msg.value}(_owner, _model);
        cars.push(car);
    }

    function create2andSendEth(
        address _owner,
        string memory _model,
        bytes32 salt
    ) public payable {
        Car car = (new Car){value: msg.value, salt: salt}(_owner, _model);
        cars.push(car);
    }
}
