// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract DataTypes{
    bool x = true; 
    uint32 z = 128; 
    uint8 y = uint8(z);
    address a = address(0);

    function getAdrress() public view returns(address){
        return a;
    }
}