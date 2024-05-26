// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld { 
    mapping(address => uint) received; 


    //examplifying what re-entrance attack is 
    // function withdraw() external{
    //     //send whatever money sent by the user back to them 
    //     uint value = received[msg.sender];
    //     received[msg.sender] = 0; //better --> no re-entrance attack 
    //     payable(msg.sender).call{value: value}("");
    //     // received[msg.sender] = 0; //but this doesnt stop user from recalling the function because it is sent to 0 after we give them control
    // }

    // receive() external payable {
    //     received[msg.sender] += msg.value; 
    // }

    // fallback() external payable{
    //     received[msg.sender] += msg.value; 
    // }

    //if address doesnt have 1 ethereum, sent = false 
    function withdraw() external{
        (bool sent, ) = payable(msg.sender).call{value : 1 ether}("");
    }
}