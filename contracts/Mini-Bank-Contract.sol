// SPDX-License-Identifier: MIT

// Create a fucntion for find total balance of contract.
pragma solidity ^0.8.5;

contract bank{
    mapping(address => uint)  balance;
    address owner;
    modifier onlyowner{
        require(owner == msg.sender, "Yor are not the owner");
        _;
    }
    constructor(){
        owner = msg.sender;
    }

    event balanceAdded(uint amount, address depositedTo);

    function deposite() public payable  returns (uint) {
        balance[msg.sender] += msg.value;
        emit balanceAdded(msg.value, msg.sender);
        return balance[msg.sender];

    }
    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }

    function transfer(address reciver, uint amount) public onlyowner{
        require(balance[msg.sender] >= amount, "!!!!!!!!!!!!Not enough Balance!!!!!!!!!");
        require(msg.sender != reciver, "You are using same address. Change sender address.");

        uint preBalance = balance[msg.sender];
        balance[msg.sender] -= amount;
        balance[reciver] += amount;
        assert(balance[msg.sender] == preBalance - amount);
    }

}