// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/*
Abstract contract : 
- act as base contract for another contract 
- cannot be instantiated / deployed
*/

//Basics
// abstract contract AbstractMath{
//     //can do all you do in a normal function 
//     function return1() public pure returns (uint){
//         return 1; 
//     }

//     //abstract function - only in abstract contracts 
//     ///function without implementtion must be "virtual" to be overridden
//     function getValue() public virtual view returns (uint);

//     function add5() public view returns (uint){
//         return getValue() + 5; 
//     }

// }


// contract Math is AbstractMath { //ned to implement all abstract functions !
//     uint x; 

//     function setX(uint _x) public{
//         x = _x;
//     }

//     function getValue() public override view returns (uint){
//         return x; 
//     }
// }


//Using constructor to force a contract to be abstract

abstract contract Test{
    uint x;

    constructor(uint _x) internal {
        //get error if contract is nonabstract and visibility internal 
        //get deploy the non-abstract contract because internal
        //marking constructor as internal thus forces you to state the contract as abstract
        x = _x; 
    }
}


contract A is Test(2){
}