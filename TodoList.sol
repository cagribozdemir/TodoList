// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Insert, update, read from array of structs
contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }
    // declaring an array of the struct
    Todo[] public todos;

    // creating a todo array
    function create(string calldata _text) external {
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }

    // updating description for the given index
    function updateText(uint _index, string calldata _text) external {
        todos[_index].text = _text;

        // Todo storage todo = todos[_index];
        // todo.text = _text;
    }

    function get(uint _index) external view returns (string memory, bool) {
        // storage - 29397 gas (cheaper option)
        // memory - 29480 gas
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // marking as completed/incompleted function
    function toogleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}
