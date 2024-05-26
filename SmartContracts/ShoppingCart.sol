// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/*
Create a program for shoppers to create shopping lists.

Important to note : 
One cannot loop through mappings as if it were a dictionnary --> it's a hash table. 
So, 
Better to create a mapping, which links to a structure, 
and then check whether there exists a structure named/referenced as the strcuture desired. 
*/

contract ShoppingCart{
    mapping(address => Shopper) shoppers; 

    struct Shopper{
        mapping(string => List) lists;
        string[] listNames; 
    }

    struct Item{
        string name; 
        uint256 quantity;
    }

    struct List{
        string name; 
        Item[] items; 
    }

    function listExists(string memory listName) internal view returns (bool){
        return bytes(shoppers[msg.sender].lists[listName].name).length != 0; 
    }

    function createList(string memory listName) public {
        require(bytes(listName).length != 0, "Name is empty");
        require(!listExists(listName), "List name already used");
        shoppers[msg.sender].listNames.push(listName);
        shoppers[msg.sender].lists[listName].name = listName; 
    }

    function getListNames() public view returns(string[] memory){
        return shoppers[msg.sender].listNames;
    }

    function getItemNames(string memory listName) public view returns(string[] memory){
        require(listExists(listName), "List name does not exist");
        uint256 size = shoppers[msg.sender].lists[listName].items.length;
        string[] memory names = new string[](size);
        for (uint256 i = 0; i < size; i++){
            names[i] = shoppers[msg.sender].lists[listName].items[i].name;
        }

        return names; 
    }

    function addItem(string memory listName, string memory item, uint256 quantity) public {
        require(listExists(listName), "List name does not exist");
        shoppers[msg.sender].lists[listName].items.push(Item(item, quantity));
    }

}