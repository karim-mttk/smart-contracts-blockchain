// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

// get funds from users/people
// withdraw funds
// set min funding value in USD

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;    

    uint256 public minimumUSD = 50 * 1e18;
    //ethereum block chain takes  

    address[] public funders; 
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        //getConversionRate(msg.value);
        //require(msg.value >= minimumUSD, "Didn't send enough!!");
        require(msg.value.getConversionRate() >= minimumUSD, "Didn't send enough!!");
        //msg.value.getConversionRate()
        // code to handle multiple funders
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }
    // add code to allow users to withdraw funds
    // function withdraw(){}
    //the functions that deal with converting price has been moved to a seperate class in 
}
