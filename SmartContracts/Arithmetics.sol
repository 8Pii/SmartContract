// SPDX-License-Identifier: MIT
// pragma solidity >=0.4.0 <0.9.0;

// import "https://github.com/ConsenSysMesh/openzeppelin-solidity/blob/master/contracts/math/SafeMath.sol";


contract HelloWorld{
    //cant represent decimals in solidity 
    //multiply by 100, divide by the "int" part (like 21 in 21.55), and 55 is the remainder 

    function testMath(uint8 x, uint8 y) public pure returns(uint8){
        // return SafeMath.mod(x,y);
        uint z = 2.9999e10; //here can use . --> but not e-10
        assert(x >= y);
        return x - y;
    }



}