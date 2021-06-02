// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Wallet {
    address payable public owner;

    event Deposit(address sender, uint amount, uint balance);
    event Withdraw(uint amount, uint balance);
    event Transfer(address to, uint amount, uint balance);

    constructor() payable {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "no access, not owner!");
        _;
    }

    function deposit() public payable{
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

    function withdraw(uint _amount) public payable onlyOwner{
        owner.transfer(_amount);
        emit Withdraw(_amount, address(this).balance);
    }
    function transferEther(address payable _to, uint _amount) public {
        _to.transfer(_amount);
        emit Transfer(_to, _amount, address(this).balance);
    }
    function getBalance() public view returns(uint){
        return address(this).balance;
    }

}