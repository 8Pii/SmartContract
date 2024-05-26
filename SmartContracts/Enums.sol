// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/*
ENUMS : 
--> imagine want to keep track of status of orer
--> imagine three states: pending, shipped, delivered

allows us to declare custom types that have pre defined values mapping to int

*/

contract HelloWorld{
    enum Status{ //uint8 types
        Pending, //0
        Shipped, //1
        Delivered //2 --> automatic (vs. mapping)
    }

    Status public status; //by default 0

    function setStatus(Status val) public{
        status = val; 
    }

    function isDelivered() public view returns(bool){
        return status == Status.Delivered; 
    }

    function setShipped() public{
        status = Status.Shipped;
    }

    function reset() public{
        delete status; //resets to default value
    }
}