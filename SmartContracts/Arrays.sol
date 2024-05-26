// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


//here, arrays are dynamically sized, but only same type within the array 

contract HelloWorld{
//     // uint[5] public numbers = [1,2]; 
//     // uint[5] public numbers; //0s
    
//     ///ONLY FOR STORAGE ARRAYS ! 
//     // uint[] public numbers = [1,2];
//     // function add(uint x) public { 
//     //     numbers.push(x); //only for dynamic 
//     // }

//     // function pop() public {
//     //     numbers.pop(); //like python, cpp, etc...
//     // }

//     // function length() public view returns(uint){
//     //     return numbers.length; 
//     // }

//     // function remove(uint idx) public{
//     //     delete numbers[idx]; //back to default , in case where not init --> 0. 
//     // }

//     // //FOR MEMORY : 
//     // function test() public {
//     //     // uint[] memory numbers; //need to spe location
//     //     // numbers.push(1); //TypeError: Member "push" is not available in uint256[] memory outside of storage.
//     //     //then, not a dynamically sized array cause IN MEMORY 
//     //     //BUT can set their size dynamically !!

//     //     //conversions - need to be explicit 
//     //     uint256[3] memory numbers = [uint256(1),uint256(2),uint256(3)]; // set size, include memory, explicit conversions
//     // }

//     //DYNAMICALLY ALLOCATE A FIXED SIZED ARRAY INTO MEMORY 
//     // uint constant x = 1; 
//     // uint[] public nums = [1,2]; //stored in storage

//     // function test(uint size) public returns (uint[] memory){
//     //     //dynamically allocate a fixed sized array into memory

//     //     // uint[size] memory numbers; //cant do this with a dynamic value
//     //     // uint[x] memory numbers; //no error cause x is constant 

//     //     uint[] memory numbers2 = new uint[](size); //this solves the errors 
//     //     uint[] memory numbers3 = nums; //this will create a copy of nums (storage) in memory 
//     //                                     //any changes made to numbers3 wont change nums. 
//     //                                     //but, memory to memory --> creates alias (ref) to the original (changes apply)
//     //     numbers3[1] = 0;

//     //     return numbers2;
//     // }

//     //ARRAY REFS: memory to memory ! alias not copies ! 
//     // function test() public pure returns (uint[3] memory, uint[3] memory){
//     //     uint[3] memory nums = [uint(1), uint(2), uint(3)];
//     //     uint[3] memory nums2 = nums;
//     //     nums2[1] = 0; 
//     //     return(nums, nums2);
//     //     //gets same values & change cascades

//     // }

//     //Arrays super expensive in solidity --> careful the gas --> batch txn ! still expensive 
//     //loops are expensive 

    //MULTI-D ARRAYS 
    // function test() public pure returns(uint[][3] memory){
    //     uint[][3] memory x = [new uint[](4), new uint[](12), new uint[](3)]; //dynamic sub-vectors! 
    //     return x;
    // }

    uint[][3] public x = [new uint[](4), new uint[](12), new uint[](3)];
    constructor() {
        x;
        x;
        x;
        x[1][11] = 3; //cant do this --> inside constructor ! 
    }

    function setElt(uint idx1, uint idx2, uint value) public {
        require(idx1 < x.length, "idx1 oob");
        require(idx2 < x[idx1].length, "idx1 oob");

        x[idx1][idx2] = value; 
    }

    //smart solution to remove an array element using pop! 
    uint256[] numbers; 
    function removeNumber(uint256 index) public {
        require(index < numbers.length, "Index out of bounds");
        numbers[index] = numbers[numbers.length - 1];
        numbers.pop(); // Removes the last element
    }
}


// pragma solidity ^0.4.6;

// contract Arrays{
    
//     // dynamic list of length 2 bools
//     bool[2][] flags;
    
//     function Arrays() {
//         // append a length 2 array to the dynamic list of flags
//         flags.push([true,true]);
//     }
    
//     function appendFlag() returns(uint length) {
//        // append another length 2 array to the dynamic dimension
//        return flags.push([true,true]);
//     }
    
//     // return a length 2 array stored in the dynamic dimension
//     // will throw if index > flags.length-1 (index starts at 0)
//     function getFlags(uint index) constant returns(bool[2] flagList) {
//         return(flags[index]);
//     }
    
//     // return one flag from the array
//     function getFlag(uint dynamicIndex, uint lengthTwoIndex) constant returns(bool flag) {
//         return flags[dynamicIndex][lengthTwoIndex];
//     }
    
//     // return a count of length 2 arrays stored in flags;
//     function getFlagsCount() constant returns(uint count) {
//         return flags.length;
//     }
    
// }