// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

// get funds from users/people
// withdraw funds
// set min funding value in USD
import "./PriceConverter.sol";

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;    

    uint256 public minimumUSD = 50 * 1e8;
    //ethereum block chain takes  

    address[] public funders; 
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;

    constructor(){
        i_owner = msg.sender;
    }

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

    //the functions that deal with converting price has been moved to a seperate class in 

    function withdraw() public onlyOwner {
        //require(msg.sender == owner, "Sender not 'owner'!");
       
        for(uint256 funderIndex = 0; funderIndex<funders.length; funderIndex++){
                address funder = funders[funderIndex];
                addressToAmountFunded[funder] = 0;
        }
        //reset the array

        funders = new address[](0);

        //properly withdraw the funds

        //3 different ways to move funds:

        //transfer
         payable(msg.sender).transfer(address(this).balance);

        //send 
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send failed");
        //call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }
    //modifier
    modifier onlyOwner{
        //require(msg.sender == i_owner, "Sender not 'owner'!");
         if(msg.sender != i_owner){ revert NotOwner(); }
        _;

    }
    //what happens if someone sends this contract some ETH without calling the fund function
    receive() external payable {
        fund();
    }
    fallback() external payable{
        fund();
    }
}
