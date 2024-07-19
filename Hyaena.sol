// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Hyaena {

    string ticker = "HYA";
    address owner;
    mapping (address => uint) balances;
    uint limit = 10000;
    bool burnable = true;

    constructor () {
        owner = msg.sender;
    }

    function mint(address _addr, uint _amount) public {
        require(msg.sender == owner, "You are not the owner");
        limit += _amount;
        balances[_addr] += _amount;
    }

    function send(address _receiver, uint _amount) public {
        require(_amount < balances[msg.sender], "You do not have enought HYAENAS");
        balances[msg.sender] -= _amount;
        balances[_receiver] += _amount;
    }

    function burn(address _target, uint _amount) public {
        require(burnable == true, "The token is not burnable");
        require(owner == msg.sender, "You are not the owner");
        require(_amount < balances[_target]);
        limit -= _amount;
        balances[_target] -= _amount;
    }

}