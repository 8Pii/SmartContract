// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


/*
Modifiers akin to @Property
Modifiers for params possible 
many Modifiers for a function possible
_; act as the number of times the function is called 
    if you have 2 modifiers, the first _; calls the second modifiers (if both are included in the function)
    and if the 2 modifier has 3 _; --> function is called 3 times !
*/

//INTRO 
// contract HelloWorld{
//     //INTRO MODIFIER
//     address owner; 
//     uint public modifierCount; 
//     uint public value; 

//     constructor(){
//         owner = msg.sender;
//     }

//     modifier onlyOwner{
//         require(msg.sender == owner);
//         modifierCount ++;
//         _; //executes the function is being modified - otherwise modifier useless
//     }

//     function test1(uint x) public onlyOwner{
//         value = x;
//     }
// }

//EXAMPLE 2
// contract HelloWorld{
//     uint public x; 
//     uint public y; 
//     uint public z; 

//     modifier costs(uint value){
//         require(msg.value >= value);
//         _;
//     }
//     //need to enter a cost to be able to set param value
//     function setX(uint num) public payable costs(1 wei){
//         x = num;
//     }

//     function setY(uint num) public payable costs(2 wei){
//         y = num;
//     }
//     function setZ(uint num) public payable costs(3 wei){
//         z = num;
//     }
// }

//pass parameter from the function to the modifier --> validating function argument!
contract HelloWorld{
    uint public x; 
    uint public y; 
    uint public z; 

    modifier costs(uint value){
        require(msg.value >= value);
        _;
    }

    modifier greaterThan(uint value, uint min){
        require(value > min);
        _;
    }


    //need to enter a cost to be able to set param value
    function setX(uint num) public payable costs(1 wei) greaterThan(num, 10) {
        x = num;
    }

    function setY(uint num) public payable costs(2 wei) greaterThan(num, 10) {
        y = num;
    }
    function setZ(uint num) public payable costs(3 wei) greaterThan(num, 10) {
        z = num;
    }
}