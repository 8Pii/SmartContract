// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


contract MathUtils {
    function floor(int256 value) public pure returns (int256) {
        int256 remainder = value % 10; 
        return value - remainder; 
    }

    function ceil(int256 value) public pure returns (int256) {
        int256 remainder = value % 10; 
        if (remainder > 0){
            return value + (10 - remainder);
        } else if (remainder == 0){
            return value; 
        }
        return value - 10 - remainder; 
    }

    function average(int256[] memory values, bool down)
        public
        pure
        returns (int256)
    {
        if (values.length == 0){
            return 0;
        }
        
        int256 sum = 0; 
        for (uint256 i = 0; i < values.length; i++) {
            sum += values[i];
        }
        int256 avg = sum / int256(values.length); // Calculate average properly
        
        
        return down ? floor(avg) : ceil(avg);
    }
}
