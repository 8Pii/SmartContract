// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {
    /*
    MAIN THREE UNITS (are keywords)
    1 wei : smallest unit of ether (fractional amount of ethereum) 
    1 gwei : 1e9 --> 1 billion wei 
    1 ether = 1e18 wei --> 1 billion gwei (1 ethereum) 
    */ 

    uint w = 1 wei; 
    uint g = 1 gwei;
    uint e = 1 ether; 

    //How to receive ethereum into a smart contract 
    uint256 public received; //= 0 ; 
    uint256 public fallbackReceived; 

    //how to send ethereum to a specific FUNCTION --> call function then send ethereum to that rather than sc address
    uint256 public payReceived; 
    function pay() external payable {
        payReceived += msg.value; 
    }

    //no payable : cant send ethereum --> if no payable transaction reverted to the initial state
    //if no receive function --> fallback is triggered 
    receive() external payable{ //funciton not seen when deploying --> function is called if msg.data is blank
                                //msg.data is empty : not calling the function, not sending any data to the smart contract
                                //if not empty receive() not called
                                //but sending money instead --> triggering receive() 
        received += msg.value; //(received have to be type uint256)
    }

    fallback() external payable{
        //called any time that there is no function that can handle what is sent to the smart contract 
        fallbackReceived += msg.value; 
    } //will be called when money is sent to the contract AND msg.data is NOT empty.
    /*
    fallback() is like a default switch of the Else statement 
    is called when there is no way to handle previous cases --> last resort 

    triggered when : --> play with the "Low Level Interactions --> msg.data == CALLDATA // msg.value = wei_value then TRANSACT
    - send eth to smart contract & msg.data !empty & contains some function that doesnt exist or info that cant be handled by smart contract
    - try to call a function on the SC that doesnt exist --> even if not sending eht, just doing sth that cant be handled 
    */



}