//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

//get funds from users/people
//withdraw funds
// set min funding value in USD

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUSD = 50;



    function fund() public payable {
        //to set a min fund in USD
        //1. How do we send ETH to this contract?

        //number = 6;
        require(msg.value > minimumUSD, "Didn't send enough!!");

        function getPrice() public {
            //ABI
            //Address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e

            AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        }

        function getVersion() public view returns (uint256){
            AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
            return priceFeed.version();
        }


        function getConversionrate(){}
        

        //reverting?
        //undo any action before and send remaining gas back

    }

    //function withdraw() public {
        // add code to allow users to withdraw funds
    //}

}
