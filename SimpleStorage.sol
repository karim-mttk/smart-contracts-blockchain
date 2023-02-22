//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

//All of this compiles to, Ethereum Virtual Machine(EVM)
//Avalanche, Fantom, Polygon

contract SimpleStorage{ //contract is like a class in other prog.languages

    struct People{
        uint256 favNum;
        string name; 
    }
    //favNum is getting indexed at 0 and person is getting indexed at 1
    uint256 favNum;

    mapping(string => uint256) public nameToFavoriteNumber; //hashtables, dictionaries
    
    //uint256 public favNumslist;
    People[] public people;

    function store(uint256 _favNum) public virtual {
        favNum = _favNum;
        retrieve;
    }
    //view, pure
    //does not modify the state of the block chain
    function retrieve() public view returns(uint256){
        return favNum;
    }
    //calldata, memory, storage
    function addPerson(string memory _name, uint256 _favNum) public{
        people.push(People(_favNum, _name));
        nameToFavoriteNumber[_name] = _favNum;
    }
}
