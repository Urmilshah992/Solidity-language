// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//ou can define your own type by creating a struct.
//They are useful for grouping together related data.
//Structs can be declared outside of a contract and imported in another contract.

contract structs {
    struct toDo {
        string text;
        bool compleTed;
    }

    toDo[] public Todo;

    //there are 3 ways to initialize a struct
    //1)calling like a function
    function firstway(string memory _text) public {
        Todo.push(toDo(_text, false));

        //2) Key Value mapping
        Todo.push(toDo({text: _text, compleTed: false}));

        //3) Initialize a emty struct and then updating it

        toDo memory todo;
        todo.text = _text;
        Todo.push(todo);
    }

    //getter function for toDo list
    function getValue(uint256 _index) public view returns (string memory text, bool compleTed) {
        toDo storage todo = Todo[_index];
        return (todo.text, todo.compleTed);
    }

    //update Text Data
    function updateData(uint256 _index, string memory _text) public {
        toDo storage todo = Todo[_index];
        todo.text = _text;
    }

    //update Completed Bool value
    function updateData2(uint256 _index) public view {
        toDo storage todo = Todo[_index];
        todo.compleTed != todo.compleTed;
    }
}
