//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";

contract Charity {
    address payable public beneficiary;
    mapping(address => uint) public donations;
    address public owner;
    event Donated(address indexed _from, uint _value);

    constructor() {
        owner = msg.sender;
    }

    function donate() public payable {
        require(msg.value > 0, "Donation must be greater than 0 ETH");
        donations[msg.sender] += msg.value;
        emit Donated(msg.sender, msg.value);
    }

   /* function viewDonations() public view returns (address[] memory, uint[] memory) {
        address[] memory donors = new address[](address(0));
        uint[] memory amounts = new uint[](0);
        for (uint i=0; i<donations.length; i++){
            donors.push(user);
            amounts.push(donations[user]);
        }
        return (donors, amounts);
    }*/

    function viewBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        beneficiary.transfer(address(this).balance);
    }
}
