// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Conditionals {
    bool canEdit = true; 
    bool admin = false; 

    function canEditDoc() public view returns (uint) {
        // if (canEdit){
        //     return true;
        // } else if (admin) {
        //     return true; 
        // } else if (2 < 3){
        //     return true; 
        // }
        // else {
        //     return false; 
        // }

        return canEdit || admin ? (true ? 1 : 0) : 0;

    }
}