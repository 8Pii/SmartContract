// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract FancyShirts {
    // Write your code here

    enum Size{
        Small,
        Medium,
        Large
    }

    enum Color{
        Red, 
        Green,
        Blue
    }

    struct Shirt{
        Size size;
        Color color; 
    }

    mapping(address => Shirt[] ) public shirts;

    modifier correctPrice(Size size, Color color){
        require(getShirtPrice(size, color) == msg.value, 
               "incorrect amount sent");
        _;
    }

    function getShirtPrice(Size size, Color color) public pure returns(uint256){
        uint256 price; 

        if (size == Size.Small) {
            price += 10 wei; 
        } else if (size == Size.Medium){
            price += 15 wei; 
        } else if (size == Size.Large){
            price += 20 wei; 
        }
        if (color != Color.Red){
            price += 5; 
        }
        return price; 
    }

    function buyShirt(Size size, Color color) public payable correctPrice(size, color){
        Shirt memory shirt = Shirt(size, color);
        shirts[msg.sender].push(shirt);
    }
    
    function getShirts(Size size, Color color) public view returns (uint256){
        uint256 count; 

        for (uint256 i; i < shirts[msg.sender].length; i++){
            if (
                shirts[msg.sender][i].size == size &&
                shirts[msg.sender][i].color == color
            ){
                count++;
            }
        }
        return count; 
    }


    
}
