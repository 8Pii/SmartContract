// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld{
    /*
    GLOBAL KEY VARIABLES
    this    --> refers to the current instance of the contract itself 
    msg     --> how the smart contract was executed (who, how much,...)
    block   --> information about the block that the tx being sent to the contract is included in 
            --> block where the smart contract is executed on 
    tx      --> info about the transaction (origin to bottom) 
    */ 

    function getBalance() public view returns(uint){
        return address(this).balance; //in all addresses you have the balance property. 
    }

    function viewMsg() public view returns(address, address){
        return (msg.sender, tx.origin); //sender: who invoked the smart contract 
        //msg.data : non modifiable non persistent array that contains the arguments passed to a specific function 
        //msg.sig : first 4 bytes --> function that is to be called 
        //msg.value : references how much ETH is sent to the function/smart contract from the tx that came in
    }

    //block.number
    //block.chainid
    //block.gaslimit
    //block.difficulty
    //block.timestamp
    //block.coinbase
    function viewBlockNumber() public view returns (uint){
        return block.number;
    }

    function viewGas() public view returns (uint){
        return gasleft(); 
    }

}