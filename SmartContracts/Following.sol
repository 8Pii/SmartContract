// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Following {
    // Write your code here
    mapping(address => address[]) addressMap;

    function follow(address toFollow) public{
        require(addressMap[msg.sender].length < 3, "queue too long");
        require(msg.sender != toFollow, "cant follow urself");

        addressMap[msg.sender].push(toFollow);
    }

    function getFollowing(address addr) public view returns(address[] memory){
        address[] memory queue = addressMap[addr];
        return queue;
    }

    function clearFollowing() public{
        delete addressMap[msg.sender];
    }
    
}
