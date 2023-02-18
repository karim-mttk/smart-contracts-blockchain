//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{

    struct People{
        uint256 favNum;
        string name; 
    }
    //favNum is getting indexed at 0 and person is getting indexed at 1
    uint256 favNum;
    
    //uint256 public favNumslist;
    People[] public people;

    function store(uint256 _favNum) public {
        favNum = _favNum;
        retrieve;
    }

    //view, pure
    //view does not burn gas as it only reads data
    function retrieve() public view returns(uint256){
        return favNum;
    }

    function addPerson(string memory _name, uint256 _favNum) public{
        people.push(People(_favNum, _name));
    }
}
