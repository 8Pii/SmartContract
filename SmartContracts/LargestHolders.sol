// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract LargestHolder {
    address[] holders; 
    uint256[] balances; 

    uint maxIter = 10; 
    bool balanceSubmitted; 

    address largestAddr; 
    uint256 largestBalance; 

    uint256 numTx; 
    uint256 processStartIdx; 
    uint256 processEndIdx;
    
    
    function submitBalances(
        uint256[] memory _balances,
        address[] memory _holders
    ) public {
        require(!balanceSubmitted, "balances have been already submitted");
        balanceSubmitted = true; 

        holders = _holders; 
        balances = _balances;

        numTx = holders.length / maxIter ; 
        if (numTx * maxIter < holders.length) numTx ++; 

        processEndIdx = maxIter; 
        if (processEndIdx > balances.length){
            processEndIdx = balances.length;
        }
           
    }

    function process() public {
        require(balanceSubmitted, "balance not yet submitted");
        require(numTx > 0, "have processed all balances already");

        for (uint256 idx = processStartIdx; idx < processEndIdx; idx++){
            uint256 amount = balances[idx];

            if (amount > largestBalance){
                address account = holders[idx];
                largestAddr = account; 
                largestBalance = amount; 
            }
        }

        processStartIdx = processEndIdx; 
        processEndIdx += maxIter; 
        if (processEndIdx > balances.length){
            processEndIdx = balances.length;
        }
        numTx --; 
    }

    function numberOfTxRequired() public view returns (uint256) {
        require(balanceSubmitted, "balance not yet submitted");
        return numTx; 
    }

    function getLargestHolder() public view returns (address) {
        require(numTx == 0, "not finished processing");
        return largestAddr;
    }
}
