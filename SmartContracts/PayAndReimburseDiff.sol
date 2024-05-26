// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {
    mapping(address => uint) changeOwed; 

    //Example : imagine you pay more than aimed for ... 

    function pay() external payable{
        uint value = msg.value;
        if (value > 1000){
            // payable(msg.sender).transfer(value - 1000); //--> not the best way
            //instead : (all the following including withdraw() function :
            changeOwed[msg.sender] = value - 1000; 
            //why is this better? because it gives the contract the possibility to FAIL & not exploitable for thieves
        }
    }

    function withdraw() external {
        uint value = changeOwed[msg.sender];
        changeOwed[msg.sender] = 0; 
        payable(msg.sender).transfer(value); //using transfer here for simplicity 
    }

    

}