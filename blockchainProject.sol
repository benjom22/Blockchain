pragma solidity >=0.7.0 <0.9.0;

contract Charity{
    address payable public beneficiary;
    mapping(address => uint) public donations;
    address public owner;
    event Donated(address indexed _from, uint _value);

    constructor() public {
        owner = msg.sender;
    }

    function donate() public payable {
        
    }

}