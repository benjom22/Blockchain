//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Charity {
    address payable public beneficiary;
    mapping(uint=>Donator) public donators;
    address public owner;
    uint256 counter=0;


    constructor() {
        owner = msg.sender;
    }

    struct Donator{
        uint _id;
        address sender;
        uint amount;
    }

     function GetMessage() public pure returns (string memory) {
        return "Thank You for Your donation to our charity";
    }

    modifier donationVal(){
           require(msg.value > 0, "Donation must be greater than 0 ETH");
           _;
    }

    function donate() public payable donationVal {
        incrementCount();
        donators[counter]=Donator(counter, msg.sender, msg.value);
    }

    function incrementCount() internal{
        counter+=1;
    }

    function viewBalance() public view returns (uint) {
        return address(this).balance;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Only owner can withdraw");
        _;
    }

    function withdraw() public onlyOwner {
        beneficiary.transfer(address(this).balance);
    }

}
