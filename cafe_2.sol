// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Cafe {
    
    enum Shopping {milkshake, cake, juice, icecream, coffee, water}
    Shopping shop;

    address payable owner;
    address payable creator;

    constructor(address payable _creator) {
        require(creator != msg.sender, "creator can not be the owner");
        owner = payable(msg.sender);
        creator = _creator;
    }

    function Milkshake() public payable {
        require(msg.value == (10 ether), "please submit 10 Tether");
        shop = Shopping.milkshake;
    }

    function Cake() public payable {
        require(msg.value == (8 ether), "please submit 8 Tether");
        shop = Shopping.cake;
    }

    function Juice() public payable {
        require(msg.value == (3 ether), "please submit 3 Tether");
        shop = Shopping.juice;
    }

    function IceCream() public payable {
        require(msg.value == (5 ether), "please submit 5 Tether");
        shop = Shopping.icecream;
    }

    function Coffee() public payable {
        require(msg.value == (2 ether), "please submit 2 Tether");
        shop = Shopping.coffee;
    }

    function Water() public payable {
        require(msg.value == (1 ether), "please submit 1 Tether");
        shop = Shopping.water;
    }

    modifier WithdrawCreator {
        uint contractBalance = address(this).balance;
        creator.transfer(contractBalance/5);
        _;
    }

    function WithdrawOwner() public payable WithdrawCreator {
        uint contractBalance = address(this).balance;
        owner.transfer(contractBalance);
    }
}