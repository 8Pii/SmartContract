// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


/*
Recall : Submitting a txn to a blockchain, dont get a number or array (like a function) 
Events = logs that can be emitted from the sc stored on the blockchain 
specifically, stored in the txn logs 
Property of a txn : logs --> tracks arguments passed to sc functions & also events emitted during that sc txn 
Events stored in the logs of the txn 
Can see whatev inside the sc 
Events can be used to see whatev is happening in terms of the state of the sc  & update UI
e.g. UI displays info about web3 app & we want it to show live updates 
--> instead of pulling the sc and making calls --> better listen for events to be emitted 
as soon as event is emitted, can update on the UI --> using WEB HOOK
*/

contract Auction {
    //someone deploying a sc whose auctionning off some item 
    //whoever the winner is --> owner will give irl (assume enforced) 
    //need a bid and highest bidder

    address owner; 
    address highestBidder; 
    uint highestBid; 

    mapping(address => uint) oldBids; 

    event Bid(address indexed bidder, uint value);  //can have max 3 indexed args (takes more space in blockchain) 
                                                    //index is "topic", otherwise, if not indexed, its "data"
    event StopAuction(address highestBidder, uint highestBid); //no need for indexed cause only 1 highestbidder


    constructor(){
        owner = msg.sender; 
    }

    function bid() external payable {
        require(msg.value > highestBid, "bid too low");
        require(owner != msg.sender, "owner cannot bid");

        oldBids[highestBidder] = highestBid;

        highestBid = msg.value; 
        highestBidder = msg.sender; 

        emit Bid(msg.sender, msg.value);    //can be put anywhere after the require sttmts 
    }
    
    function withdraw() external{
        require(msg.sender != owner, "owner cannot withdraw");
        uint value = oldBids[msg.sender];
        oldBids[msg.sender] = 0; 
        (bool sent, ) = payable(msg.sender).call{value: value}("");
        require(sent, "pmt failed");
    }

    function stopAuction() external{
        require(msg.sender == owner, "only owner can stuff");
        emit StopAuction(highestBidder, highestBid);
        selfdestruct(payable(owner));
    }
}