//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{

uint256 favNum;

function store(uint256 _favNum) public {
    favNum = _favNum;
}


}