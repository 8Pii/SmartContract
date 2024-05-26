// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


contract RestrictedCount {
    // Write your code here
    int256 public count; 
    address owner; 
    int256 constant min = -100;
    int256 constant max = 100;

    constructor() {
        owner=msg.sender;
    }
    modifier onlyOwner(){
        require(owner == msg.sender, "must be called by owner");
        _;
    }
    modifier bounds(int256 value){
        require((value >= min)&&(value<=max), "not within bounds");
        _;
    }

    function getCount() public view onlyOwner returns(int256){
        return count; 
    }

    function add(int256 value) public onlyOwner bounds(count+value){
        count += value; 
    }

    function subtract(int256 value) public onlyOwner bounds(count-value){
        count -= value;
    }
}