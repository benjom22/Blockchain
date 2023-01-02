pragma solidity >=0.7.0 <0.9.0;

contract MyContract{
    Customer[] public customers;
    uint256 customerCounter;

    struct Customer{
        string name;
        string lastname;
        uint256 id;
    }

    function addCustomer(string _name, string _lastname, uint256 _id){
        customers.push(_name, _lastname, _id);
        customerCounter+=1;
    }

}