// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract SimpleBank {
    mapping(address => uint) public balances;

    function deposit(address _depositor, uint _amount) public {
        balances[_depositor] += _amount;
    }

    function withdraw(address _withdrawer, uint _amount) public {
        balances[_withdrawer] -= _amount;
    }

    function getBankBalance(address _addr) public view returns(uint) {
        return balances[_addr];
    }
}