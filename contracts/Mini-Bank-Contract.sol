// SPDX-License-Identifier: MIT

pragma solidity ^0.8.5;
import "./Ownable.sol";

interface GovernmentInterface {
        function addTransaction(address _from, address _to, uint _amount) external;

}

contract bank is Ownable {

    GovernmentInterface governmentInsance = GovernmentInterface(/*Enter Addres after deploy the Gove contract);*/);

    mapping(address => uint) balance;
    

    event balanceAdded(uint amount, address depositedTo);

    function deposite() public payable  returns (uint) {
        balance[msg.sender] += msg.value;
        emit balanceAdded(msg.value, msg.sender);
        return balance[msg.sender];

    }

    function withdraw(uint amount) public returns (uint) {
        require(balance[msg.sender] > amount, "Not Enough Balance");
        payable(msg.sender).transfer(amount);
        balance[msg.sender] -= amount;
    }

    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }

    function transfer(address payable reciver, uint amount) public onlyowner{
        require(balance[msg.sender] >= amount, "!!!!!!!!!!!!Not enough Balance!!!!!!!!!");
        require(msg.sender != reciver, "You are using same address. Change sender address.");

        uint preBalance = balance[msg.sender];
        balance[msg.sender] -= amount;
        balance[reciver] += amount;
        //reciver.transfer(amount);
        governmentInsance.addTransaction(msg.sender, reciver, amount);
        //assert(balance[msg.sender] == preBalance - amount);
    }

    function getowner() public view returns(address){
        return owner;
    }

    function totalamount() public view  returns (uint){
        return address(this).balance;
    }
    function close() public onlyowner{
        selfdestruct(owner);
    }

}

