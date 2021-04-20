pragma solidity ^0.5.0;

contract TodoList {
    uint public taskCount = 0;

    /*
      Structure to store a Task
    */
    struct Task {
        uint id;
        string content;
        bool completed;
    }

    // Key-Value pairs to hold all tasks
    mapping(uint => Task) public tasks;

    // Events declaration
    event TaskCreated(uint id, string content, bool completed);
    event TaskCompleted(uint id, bool completed);

    /*
      Constructor to initialize the state of the contract

      Executed only once when the contract is created.
      After a contructor code is executed, the final code is deployed to blockchain.
      This final code includes public functions and code reachable through public functions.
      Constructor code or any internal method used only by constructor are not included in the final code.
    */
    constructor() public {
        createTask("First Task");
    }

    /*
      Function to create a Task
    */
    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    /*
      Function to complete a task
    */
    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }
}