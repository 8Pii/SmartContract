// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// //BASICS
// contract Storage{
//     uint public x;

//     function setX(uint newX) public{
//         x = newX;
//     }
// }

// contract Caller{
//     Storage store;
//     Storage store2;

//     constructor(){
//         store = new Storage();
//         store2 = new Storage();
//     }

//     function setX(uint x) public{
//         store.setX(x);
//     }

//     function getX() public view returns (uint){
//         return store.x(); //because x is public
//     }

//     function setX2(uint x) public{
//         store2.setX(x);
//     }

//     function getX2() public view returns (uint){
//         return store2.x(); //because x is public
//     }
// }



// //INHERITANCE - Base & Derived
// contract Storage{ 
//     uint public x; 

//     function setX(uint newX) public{
//         x = newX;
//     }

//     function getX() public virtual view returns(uint){
//         return x+10;
//     }
// }

// contract Child is Storage{ // public and internal works // private dont 
//     // //override : same base-class parameter, functionality, visibility & signature
//     // function getX() public override view returns (uint){
//     //     return x;
//     // }

//     // // overload : use the same base-class defined function by diff params
//     // function getX(uint add) public view returns (uint){ // no need for overload keyword
//     //     return x + add; 
//     // }

//     //super: when overriding base class function, still want to use base-class function --> use super
//     function getX() public override view returns (uint){
//         return x + super.getX(); //will not be recursive
//     }


// }



//now with constructors
contract Storage{ 
    uint public x; 

    constructor(uint startVal){
        x = startVal; 
    }

    function setX(uint newX) public{
        x = newX;
    }

    function getX() public virtual view returns(uint){
        return x+10;
    }
}

// contract Child is Storage(5){ //if not passing value in the constructor of Storage, child classmust be marked as abstract
//OR IN THIS WAY
contract Child is Storage{ //if not passing value in the constructor of Storage, child classmust be marked as abstract
    constructor(uint startVal) Storage(startVal){
    }

    function getX() public override view returns (uint){
        return x + super.getX(); //will not be recursive
    }


}