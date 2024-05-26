// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


contract TimedAuction {
    // Declare your event(s) here
    uint256 expiry; 
    uint256 highestBid; 
    address highestBidder; 
    address owner;
    mapping(address => uint256) oldBids;
    uint256 totalWithdrableBids; //incase users try to tamper with contract. 
    
    event Bid(address indexed sender, uint256 amount, uint256 timestamp);

    constructor(){
        expiry = block.timestamp + 5 minutes;
        owner = msg.sender; 
    }

    function bid() external payable {
        require(block.timestamp < expiry, "Auction done");
        require(msg.value > highestBid, "Go up a notch");

        oldBids[highestBidder] += highestBid; 
        totalWithdrableBids += highestBid;

        highestBidder = msg.sender; 
        highestBid = msg.value; 

        emit Bid(msg.sender, msg.value, block.timestamp);
        
    }

    function withdraw() public {
        uint256 amount = oldBids[msg.sender];
        oldBids[msg.sender] = 0; 
        totalWithdrableBids -= amount; 

        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        require(sent, "pmt failed");           
    }

    function claim() public {
        require(msg.sender == owner);
        require(block.timestamp >= expiry, "auction not done yet");
        require(totalWithdrableBids == 0, "not all users have claimed their bids yet");
        selfdestruct(payable(owner));
    }

    function getHighestBidder() public view returns (address) {
        return highestBidder;
    }
}
