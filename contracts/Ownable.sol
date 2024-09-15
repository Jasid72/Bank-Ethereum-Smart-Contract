pragma solidity ^0.8.5;


contract Ownable{
    address payable internal owner;
    modifier onlyowner{
        require(owner == msg.sender, "Yor are not the owner");
        _;
    }
    constructor(){
        owner = payable(msg.sender);
    }
}
