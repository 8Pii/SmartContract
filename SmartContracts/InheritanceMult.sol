// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract A {
    uint x;

    function setX(uint newX) public virtual {
        x = newX;
    }

    function getX() public virtual view returns (uint){
        return x; 
    }
}

contract B {
    uint y;

    function setX(uint newY) public virtual {
        y = newY;
    }

    function getX() public virtual view returns (uint){
        return y; 
    }
}

contract Child is A, B { //order matters!
    function getX() public override(A,B) view returns (uint){
        return super.getX(); //super referencing both
    }

    function setX(uint newX) public override(A,B){
        x = newX; //super referencing both
    }
}

/*
SUMMARY: 

• If we have two base classes with the same function names/definition/etc...
• We derive a third class from the 2 first 
• If we want to call that function with super. --> there's a compiling issue

• What we do is then to use override(A,B) 
NOTE: order is important in derived class definition 
--> the super.getX() will call the most recently inherited class, in this case class B
(convention : `METHOD RESOLUTION ORDER) 

e.g if Child is A,B 
and A has getX() which returns 1 & B has getX() which returns 2 
override getX() in Child and return super.getX() --> returns 2 ! 
*/