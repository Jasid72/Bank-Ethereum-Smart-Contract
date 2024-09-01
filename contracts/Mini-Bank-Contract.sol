// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

contract bank{
    mapping(address => uint) balance;
    function addBalance(uint _toAdd) public returns (uint) {
        balance[msg.sender] += _toAdd;
        return balance[msg.sender];

    }
    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }

    function transfer(address reciver, uint amount) public {
        require(balance[msg.sender] >= amount, "!!!!!!!!!!!!Not enough Balance!!!!!!!!!");
        require(msg.sender != reciver, "You are using same address. Change sender address.");
        balance[msg.sender] -= amount;
        balance[reciver] += amount;
    }

}