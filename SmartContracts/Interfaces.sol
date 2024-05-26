// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/*
INTERFACES: 
- akin to abstract contracts, only that it does not include any implemented functions 
--> only has abstract functions : no need for concrete function implementation
--> no constructor 
--> no state variables 
--> visbility MUST be EXTERNAL 
--> can have enum / struct --> because can be used in the abstract function declaration
--> to be accessed with : interface_name.Type (ReturnsValue.enum_name)
*/

interface ReturnsValue{
    //cannot have a constructor 

    function getValue() external view returns(string memory); //must be external --- no need to put virtual (implicit)
    //implementations can have different logics, but same input params and return type
}


//all threse contracts are "seen through the lense of the interface" 
contract A is ReturnsValue{
    string str = "hello world"; 
    function getValue() external override view returns(string memory){
        return str;
    }
}

contract B is ReturnsValue{
    string str = "bye world"; 
    function getValue() external override view returns(string memory){
        return str;
    }
}

contract Test{
    ReturnsValue[] values = [ReturnsValue(new A()), new B()]; //A and B must be of the same type 

    function getValues() public view returns (string[] memory){
        string[] memory strings = new string[](values.length);
        for (uint idx; idx < values.length; idx++){
            strings[idx] = values[idx].getValue(); //all contracts implement the interface's getValue() --> and type of array is ReturnsValue , so can use it
        }
        return strings;

    }
}