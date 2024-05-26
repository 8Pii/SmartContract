// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Richest{
    address richest;
    uint256 mostSent; 
    mapping(address => uint256) ledger; 

    function becomeRichest() external payable returns(bool){
        if (msg.value < mostSent){
            return false;
        }

        ledger[richest] += mostSent; //+= & before re-definition because : richest address may already have some before
        richest = msg.sender;
        mostSent = msg.value;

        return true;
    }

    function withdraw() external{
        uint256 amount = ledger[msg.sender];
        //first setting to 0 : clear balance before sending funds --> opposite would lead to re-entrance attacks
        ledger[msg.sender] = 0;
        //then transferring funds
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        require(sent); //requiring the sent to be successful 
    }

    function getRichest() public view returns(address){
        return richest;
    }

}