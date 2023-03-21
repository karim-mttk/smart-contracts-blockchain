// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FallbackExample {
    uint256 public result;

    receive() external payable{
        result = 1;
    }    
//solidity-by-example.org/fallback/
    fallback() external payable{
        result = 2;
    }
}