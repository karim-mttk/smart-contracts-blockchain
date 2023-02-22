//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {
   //overide and virtual override
    function store(uint256 _favNum) public override  {
        favNum = _favNum + 7;
    }
}