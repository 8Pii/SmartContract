// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


contract Voting {
    // Write your code here
    mapping(uint8 => uint8) voting; 
    mapping(address => bool) voters;
    uint8 mostRecentVote; 
    uint8 maxVotes; 
    

    function getVotes(uint8 number) public view returns (uint8){
        require((number >= 1) && (number <= 5), "Number must be btwn 1-5");
        return voting[number];
    }

    function vote(uint8 number) public {
        require((number >= 1) && (number <= 5), "Number must be btwn 1-5");
        require(voters[msg.sender] == false, "Must vote only once");
        voters[msg.sender] = true;
        
        voting[number] ++;
        mostRecentVote = number;
        
        if (voting[number] >= maxVotes){
            maxVotes = number; 
        }
    }

    function getCurrentWinner() public view returns (uint8){
        if (maxVotes == 0) {
            return 1;
        // if (voting[maxVotes] == voting[mostRecentVote]){
        //     return mostRecentVote;
        } else {
            return maxVotes; 
        }
    }
}
