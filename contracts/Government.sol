// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

contract Government{
    struct Transaction {
        address from;
        address to;
        uint amount;
        uint id;
    }
    Transaction[] transactionlog;

    function addTransaction(address _from, address _to, uint _amount) external {
        Transaction memory _transaction = Transaction(_from, _to, _amount, transactionlog.length);
        transactionlog.push(_transaction);
    }

    function getTransaction(uint _index) public view returns (address, address, uint){
        return (transactionlog[_index].from, transactionlog[_index].to, transactionlog[_index].amount);
    }
}