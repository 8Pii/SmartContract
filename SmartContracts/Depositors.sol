// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Competitors {
    // Write your code here
    address owner; 

    address depositor1; 
    address depositor2; 
    address maxDepositor; 

    uint256 deposit1; 
    uint256 deposit2; 

    bool withdrew; 

    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable{ 
        require(msg.value == 1 ether, "sen 1 eth exactly");
        require(deposit1 + deposit2 < 3 ether, "3 eth max deposits");

        if (depositor1 == address(0)){
            depositor1 = msg.sender;
        } else if (depositor2 == address(0)){
            depositor2 = msg.sender; 
        } 

        if (msg.sender == depositor1){
            deposit1 += msg.value; 
        } else if(msg.sender == depositor2){
            deposit2 += msg.value; 
        } else {
            revert("Not one of valid depositors.");
        }

        if (deposit1 + deposit2 >= 3 ether){
            if (deposit1 > deposit2){
                maxDepositor = depositor1; 
            } else {
                maxDepositor = depositor2;
            }
        }
        
    }


    function withdraw() external { 
        require(deposit1 + deposit2 >= 3 ether, "under amount");
        require(msg.sender == maxDepositor, "did not deposit max eth");
        payable(maxDepositor).call{value : 3 ether}("");
        withdrew = true;
    }

    function destroy() external{
        require(msg.sender == owner, "you are not the owner");
        require(withdrew == true, "maxdepositor hasnt withdrew yet");
        selfdestruct(payable(owner));
    }
    
}
