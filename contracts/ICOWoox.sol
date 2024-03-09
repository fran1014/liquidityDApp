//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Woox.sol";

contract ICOWoox {
    address admin;
    Woox public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event Sell(address _buyer, uint256 _amount);

    constructor (Woox _tokenContract, uint256 _tokenPrice){
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }
}