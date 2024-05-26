// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

abstract contract SignUpBonus {
    mapping(address=>uint256) balances;
    mapping(address=>bool) deposited; 

    function getBonusAmount() internal pure virtual returns(uint256);
    function getBonusRequirement() internal pure virtual returns(uint256);

    function deposit() public payable{
        if (!deposited[msg.sender] && msg.value > getBonusRequirement()){
            balances[msg.sender] += getBonusAmount();
        }
        deposited[msg.sender] = true; 
        balances[msg.sender] += msg.value;
    }
    
    function withdraw(uint amount) public{
        require(balances[msg.sender] >= amount, "trying more than u have");
        balances[msg.sender] -= amount; 
        (bool sent, ) = payable(msg.sender).call{value : amount}("");
        require(sent, "pmt failed");
    }

    function getBalance() public view returns(uint){
        return balances[msg.sender];
    }
}

contract Bank is SignUpBonus {
    
    function getBonusAmount() internal pure override returns(uint256){
        return 150 wei;
    }

    function getBonusRequirement() internal pure override returns(uint256){
        return 1000 wei; 
    }
}