// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// contract HelloWorld {
//     mapping(uint => bool) map; //cant use some types as keys : need to be hashable ! (eg mapping as key cant but value can
//     mapping(uint => mapping(uint => bool)) nested_map; 

//     function addItem(uint key1, uint key2, bool value) public {
//         nested_map[key1][key2] = value; 
//     }

//     function getItem(uint key1, uint key2) public view returns (bool) {
//         return nested_map[key1][key2];
//     }

// }

////USING MAPS AS LOCAL VARIABLES 
// contract HelloWorld{
//     mapping(uint => int) map_1; 

//     function x() public {
//         mapping(uint => int) storage map = map_1; //cant make an empty map inside a function 
//         map[0] = 1; 
//         map[1] = 2; //sets it for map_1 too ! (think by ref as well)
//         //useless to this : map inside a function linked to a glocal variable would
//     }

//     function getItem(uint key) public view returns (int) {
//         return map_1[key]; //any changes made on map_1 
//     }

// }


///MAPPING AS PARAMETER FOR FUNCTION 
contract HelloWorld{
    function x(mapping(uint => uint) storage map) internal {
    // function x(mapping(uint => uint) storage map) public { //--> throws error that need to use memory or calldata
                                                              //which cant cause have to be stored in storage

    }
}

//Mapping super limited : need as states for contracts thats all 