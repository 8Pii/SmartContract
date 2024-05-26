// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Operators {
    int256 y = -9; // by default 256 bits
    uint256 x = 10; // by default 256 bits
    uint256 z; 

    function op() public {
        x = x / 7; 
    }

    function getX() public view returns (uint) {
        return x;
    }

    function getY() public view returns (int) {
        return y;
    }

    function setX(uint _x) public {
        x = _x;
    }

    function setY(int _y) public {
        y = _y;
    }
}
