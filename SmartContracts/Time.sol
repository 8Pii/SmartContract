// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld{ 
    // function getTime() public view returns (uint){
    //     return block.timestamp; //time when block was mined (nonce was found) 
    //     //can do math ops on it : bock.timestamp - 1 days/minutes/hours ... 
    // } //timestamp is in the shape : unix timestamp (since unix epoch : Jan 1st 1970)

    //once a minute has passed, contract is obselete; 
    // uint expiry;
    // uint count;  

    // constructor(){
    //     expiry = block.timestamp + 1 minutes; 
    // }

    // function addOne() public {
    //     require(block.timestamp < expiry);
    //     count++;
    // }

    uint public lastTime; 
    uint count; 

    constructor(){
        lastTime = block.timestamp; 
    }

    function increment() public{
        count++; 
        lastTime = block.timestamp; 
    }

    function getMinutesSinceLastCall() public view returns (uint){
        return (block.timestamp - lastTime) / 1 minutes; 
    }

}