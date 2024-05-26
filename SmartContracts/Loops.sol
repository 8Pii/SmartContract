// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld{
    function test(uint maxLoops) public pure returns(uint){
        uint sum = 0; 
        for (uint i = 0; i < maxLoops; i++){
            sum += i;
        }

        return sum; 
    }

    // address[] public addresses; 

    // function addAddress() external{
    //     for (uint idx=0; idx < addresses.length; idx++){
    //         address currentAddress = addresses[idx];
    //         if (currentAddress == msg.sender){
    //             revert("Sender is already in addresses");
    //         }
    //     }
    //     addresses.push(msg.sender);
    // }
    ///very inefficient - addresses can grow super high --> use mapping instead mapping(address => bool) 

    address[] public addresses; 
    mapping(address => bool) addrMap; 
    function addAddress() external{
        require(addrMap[msg.sender] == false, "address already added");
        addrMap[msg.sender] = true; 
        addresses.push(msg.sender);

    }

}