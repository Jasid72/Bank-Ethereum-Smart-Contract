pragma solidity ^0.8.5;


contract Ownable{
    address owner;
    modifier onlyowner{
        require(owner == msg.sender, "Yor are not the owner");
        _;
    }
    constructor(){
        owner = msg.sender;
    }
}
