// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


contract HelloWorld{
    //any error that happens - tx reverted to previous state 
    error PaymentFailed(uint balance, bool state); 

    mapping(address => uint) balances; 

    function deposit() external payable{
        balances[msg.sender] += msg.value; 
    }

    function withdraw(uint amount) public{
        uint balance = balances[msg.sender];
        require(balance >= amount, "balance is not sufficient"); //if condition is false, all gas not burnt sent back (property of require) 
        balances[msg.sender] -= amount; 
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        // assert(balances[msg.sender] == balance - amount);   //functions like assert in python & 
        //                                                     //DOES NOT REFUND GAS NOT SPENT --> CONSUMES ALL GAS
        //                                                     //USUALLY AT END OF THE FUNCTION AS CHECK_FOR_ALL
        // require(sent, "payment failed");
        //now looking at revert : --> more clear with more advanced logic flow (not just one condition like require)
        //with revert : can raise custom errors (like w java python etc) (can define the error as global variable or within class
        if (!sent){
            // revert("Payment failed") //or
            revert PaymentFailed(balance, sent); 

        }

    }

}