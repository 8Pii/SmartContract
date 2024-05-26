// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


contract HelloWorld{

    function withdraw() public{
        //send the balance of the sc to who calls the function 
        address payable user = payable(msg.sender); 

        //send ethereum - 3 ways (3rd is the rightest) 
        // bool sent = user.send(address(this).balance);   //1 -- specify type with .send , else use .transfer
        // user.transfer(address(this).balance);           //2 -- doesnt return a value (like a bool above)
        //both these methods only forward 2300 gas max to the function receiving ethereum 
        //issue : payable(...) can have a contract argument, which limits the complexity of transaction 
                    //in the other contract, receive() / fallback() would be called. 
        //preferred way --> forwards all the gas along to when receiving eth  
        (bool sent, bytes memory data) = user.call{value: address(this).balance}(""); //string is the data sent along the value
        //to correct the underline in yellow must specify the type
        //when it is not used, var underlined in yellow 
    }

    receive() external payable{

    }

    fallback() external payable{

    }
}

//can set up infinite loops because this contract would control the withdraw function of HelloWorld contract
//need to track before we give out control so they dont drain the sc 

contract Theif{
    HelloWorld ctr = new HelloWorld(); 

    function callWithdraw() public {
        ctr.withdraw(); 
    }

    receive() external payable{
    }

    fallback() external payable{
    }

}