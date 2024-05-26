// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld{
    uint public sum; 
    uint constant sumTo = 10000; 

    uint start = 0; 
    uint end = 100; 
    uint public gasLeft;

    // function addIntegers() public {
    //     for (uint i = 1; i <= sumTo; i++){
    //         sum += i;
    //     }
    // }

    function addIntegers() public{
        require(end <= sumTo);
        uint startGas = gasleft();
        uint increment = 100; 
        for (uint i = start; i <= end; i++){
            sum += i;
        }
        start = end + 1;
        end = end + increment; 
        gasLeft = startGas - gasleft(); 
    }
}