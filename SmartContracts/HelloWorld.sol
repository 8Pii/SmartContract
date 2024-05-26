// SPDX-License-Identifier: MIT

//pragma solidity >=0.7.0 <0.9.0;          //what compiler version is valid for this smart contract to be exec under
//pragma solidity ^0.8.22.0;
pragma solidity >=0.7.0.0 <0.9.0.0;

contract HelloWorld { //class
    uint256 internal number; //default hidden constructor value = 0

    function store(uint256 num) public {
        //require(num != 0, "Number must be non-zero"); //adding basic check 
        number = num;
    }

    function get() public view returns (uint256) {
        return number; 
    }
}