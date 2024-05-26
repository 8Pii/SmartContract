// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


/*
Making a library
RULES: 
- stateless 
- cant use selfdestruct 
- cannot do inheritances
- no abstract functions in lib
- all function either view or pure 
- calling lib functions is free, no gas --> not modifying any states
- no fallback/receive functions
- can define structs/enums
*/


library Math{
    function max(int[] memory numbers) public pure returns (int){
        if (numbers.length == 0){
            return 0; 
        }
        int currentMax = numbers[0]; 

        for (uint idx; idx < numbers.length; idx++){
            currentMax = numbers[idx];
        }
        return currentMax; 
    }


    function max(uint[] memory numbers) public pure returns (uint){
        if (numbers.length == 0){
            return 0; 
        }
        uint currentMax = numbers[0]; 

        for (uint idx; idx < numbers.length; idx++){
            currentMax = numbers[idx];
        }
        return currentMax; 
    }

    function indexOf(int256[] memory numbers, int256 target) public pure returns(int){
        for (uint256 idx; idx < numbers.length; idx++){
            if (numbers[idx] == target){
                return int256(idx);
            }
        }
        return -1;
    }

    function count(int256[] memory numbers, int256 target) external pure returns(uint){
        uint countVar; 

        for (uint256 idx; idx < numbers.length; idx++){
            if (numbers[idx] == target) countVar ++;
        }

        return countVar;
    }

    function sum(int256[] memory numbers) external pure returns(int256){
        int256 arrSum; 
        for (uint256 idx; idx < numbers.length; idx++){
            arrSum += numbers[idx];
        }
        return arrSum;
    }
}



contract Test{
    int[] numbers; 
    uint[] uNumbers; 

    function addNumber(int number) public {
        numbers.push(number);
    }

    function addNumber(uint number) public {
        uNumbers.push(number);
    }

    // function getMax() public view returns(int){
    //     return Math.max(numbers);
    // }

    using Math for int[]; //can call any function with this type as first param using the function on the var type
    function getMax() public view returns(int){
        return numbers.max();
    }

    using Math for uint[];
    function getUMax() public view returns(uint){
        return uNumbers.max();
    }

    //works too !
    function getMaxes() public view returns (int, uint){
        return(numbers.max(), uNumbers.max());
    }
}