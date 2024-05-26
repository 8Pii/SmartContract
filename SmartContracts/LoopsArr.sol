// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract GridMaker {
    function make2DIntGrid(
        uint256 rows,
        uint256 cols,
        int256 value
    ) public pure returns (int256[][] memory) {
        // Declare a dynamic array of dynamic arrays
        int256[][] memory superArr = new int256[][](rows);
        
        for (uint256 i = 0; i < rows; i++) {
            // Initialize each row as a dynamic array
            superArr[i] = new int256[](cols);
            for (uint256 j = 0; j < cols; j++) {
                superArr[i][j] = value;
            }
        }
        
        return superArr;
    }

    function make2DAddressGrid(uint256 rows, uint256 cols)
        public
        view
        returns (address[][] memory)
    {
        // Declare a dynamic array of dynamic arrays
        address[][] memory superArr = new address[][](rows);
        
        for (uint256 i = 0; i < rows; i++) {
            // Initialize each row as a dynamic array
            superArr[i] = new address[](cols);
            for (uint256 j = 0; j < cols; j++) {
                superArr[i][j] = msg.sender;
            }
        }
        
        return superArr;
    }
}
