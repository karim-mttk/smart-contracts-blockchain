//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

//get funds from users/people
//withdraw funds
//set min funding value in USD

contract FundMe {

    uint256 public minimumUSD = 50;

    function fund() public payable {
        //to set a min fund in USD
        //1. How do we send ETH to this contract?

        //number = 6;
        require(msg.value > minimumUSD, "Didn't send enough!!");

        function getPrice(){}

        function getConversionrate(){}
        

        //reverting?
        //undo any action before and send remaining gas back

    }

    //function withdraw() public {
        // add code to allow users to withdraw funds
    //}

}
