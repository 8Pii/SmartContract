// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


// contract HelloWorld{

//     address owner; 

//     constructor(){
//         owner = msg.sender;
//     }

//     receive() external payable{}

//     function destroy() external{
//         require(owner == msg.sender, "not owner");
//         selfdestruct(payable(owner));  //will send balance of the contract to the address (bypass payable functions) 
//                                 //exploiting selfdestructs --> dont rely on contract balance ! 
//     }


//     function getOwner() public view returns (address){
//         return owner; 
//     }

// }


contract Winner{
    address winner; 
    uint balance; //helps against selfdestruct in thief contract
    //relying on address(this).balance is v bad ! that's where you can get exploited 
    
    function pay() external payable{
        require(msg.value == 1 ether, "need to send 1 ether");
        balance += 1; 
        if (address(this).balance == balance){
            winner = msg.sender;
        }
    }

    function withdraw() public{
        require(msg.sender == winner, "not winner");
        (bool sent, ) = payable(winner).call{value : balance}("");
        require(sent, "payment failed");

    }


}


contract Thief{
    receive() external payable{
        selfdestruct(); //pass address of the contract HelloWorld and get back all the values 
                        //imagine if ether sent >7 , then never gets executed
    }
}