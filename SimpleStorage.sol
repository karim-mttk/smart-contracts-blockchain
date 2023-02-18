//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{

    uint256 public favNum;

    function store(uint256 _favNum) public {
        favNum = _favNum;
        retrieve;
    }

    //view, pure
    //view does not burn gas as it only reads data
    function retrieve() public view returns(uint256){
        return favNum;
    }
}
