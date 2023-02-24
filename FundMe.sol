// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

// get funds from users/people
// withdraw funds
// set min funding value in USD

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUSD = 50 * 1e18;

    function fund() public payable {
        require(msg.value >= minimumUSD, "Didn't send enough!!");
        // add code to handle the funds
    }

    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e10); // 1**10 == 10000000000
    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

        return ethAmountInUsd; 
    }

    // add code to allow users to withdraw funds
    // function withdraw(){}
}
