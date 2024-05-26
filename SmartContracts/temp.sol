// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


contract AdvancedCounter {
    mapping(address => mapping(string => int256)) counters; 
    mapping(address => mapping(string => bool)) counterIdExists; 
    mapping(address => uint256) numCountersCreated;
    
    function counterExists(string memory id) internal view returns(bool) {
        return counterIdExists[msg.sender][id];
    }

    function createCounter(string memory id, int256 value) public{
        require(numCountersCreated[msg.sender] != 3, "reached max num of contracts");
        require(!counterExists(id), "counter with this id already exists");
        counters[msg.sender][id] = value; 
        numCountersCreated[msg.sender]++;
        counterIdExists[msg.sender][id] = true; 
    }

    function deleteCounter(string memory id) public {
        require(counterExists(id), "this counter exists not" );
        delete counters[msg.sender][id];
        numCountersCreated[msg.sender] --; 
        counterIdExists[msg.sender][id] = false; 

    }

    function incrementCounter(string memory id) public {
        require(counterExists(id), "this counter exists not");
        counters[msg.sender][id] ++; 
    }

    function decrementCounter(string memory id) public {
        require(counterExists(id), "this counter exists not");
        counters[msg.sender][id] --; 
    }

    function getCount(string memory id) public view returns (int256) {
        require(counterExists(id), "this counter exists not");
        return counters[msg.sender][id]; 
    }
}
