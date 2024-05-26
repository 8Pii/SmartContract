// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld{
    string public x;
    bytes public y = "hello world"; //preferred types to work with string --> index accessible (every single slot is a byte)
    //bytes representation : 0x68656c6c6f20776f726c64
    //IT REPRESENTS A BYTE ARRAY
    bytes[] public z = [bytes("hello"), "world"];

    // function testString() public returns(bytes memory){ 
    //     //underlying of y is an array ! 
    //     y[0] = "1";
    //     y.length;     
    //     y.push("1");
    //     delete y[1]; //sets to default value. 
    //     return y;
    // }
    function testString() public view returns(bytes memory){
        // return string(y); //0x68656c6c6f20776f726c64 = hello world
        //can do the reverse : bytes(string) 
        // return string(z[1]);
        return z[1];
    }

    function test(string memory str) public view returns(string memory){ //CANT STORE THE STRING IN THE STACK SO MUST INCLUDE MEMORY KEYWORD
        // bytes memory convertedStr = bytes(str); 
        // // convertedStr.push("1"); //push and pop are not available outside of storage
        // //                         //just like with arrays, we cannot have a dynamic-sized array inside of memory. 
        // //                         //instead, need to create a bytes array that is large enough to accept this character inside of it then set its value

        //implementing: create empty bytes array, set each element equal to the string, then add the char "1" & return that as a string
        // bytes memory convertedStr = new bytes(bytes(str).length + 1); //1 size larger
        string memory newStr = string.concat(string(y), str); //no need for for-loop !
        return newStr;
        



    }

}