// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


//global vars
enum Size{
    Small, 
    Medium, 
    Large
}

enum Type{
    OnePct, 
    TwoPct
}


contract Item{
    uint price; 

    constructor(uint _price){
        price = _price; 
    }

    function getPrice() public view returns(uint){
        return price; 
    }
}

contract Milk is Item {
    // enum Type{
    //     OnePct, 
    //     TwoPct
    // } //put in global namespace to be accessed from Shopping contract

    Type milkType; 
    uint litres; 

    constructor (Type _milkType, uint _litres, uint _price) Item(_price) {
        milkType = _milkType;
        litres = _litres;
    }
   
}

contract Shirt is Item {
    // enum Size{
    //     Small, 
    //     Medium, 
    //     Large
    // } //put in the global namespace

    Size size; 

    constructor (Size _size, uint _price) Item(_price) {
        size = _size; 
    }
}


contract Shopping {
    Item[] items; //both Milk and Shirt are valid bc they are type ITEM
    uint internal milkPrice = 5;
    uint internal shirtPrice = 10; 
    function addMilk(Type _type, uint litres) public{
        Milk milk = new Milk(_type, litres, milkPrice);
        items.push(milk);
    }

    function addShirt(Size size) public{
        Shirt shirt = new Shirt(size, shirtPrice);
        items.push(shirt);
    }

    function getTotalPrice() public view returns(uint){
        uint price; 
        for (uint idx; idx < items.length; idx++){
            price += items[idx].getPrice();
        }

        return price; 
    }
}