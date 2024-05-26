// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Balances{
    mapping(address => uint) balance; 

    receive() external payable{
        balance[msg.sender] += msg.value;
    }

    fallback() external payable{
        balance[msg.sender] += msg.value;
    }

    function getAmountSent(address addr) public view returns(uint256){
        return balance[addr];
    }

}