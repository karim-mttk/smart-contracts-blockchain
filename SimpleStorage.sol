// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    struct People {
        uint256 favNum;
        string name;
    }
    uint256 public favNum;
    mapping(string => uint256) public nameToFavoriteNumber;
    People[] public people;

    function store(uint256 _favNum) public {
        favNum = _favNum;
    }

    function retrieve() public view returns (uint256) {
        return favNum;
    }

    function addPerson(string memory _name, uint256 _favNum) public {
        people.push(People(_favNum, _name));
        nameToFavoriteNumber[_name] = _favNum;
    }
}
