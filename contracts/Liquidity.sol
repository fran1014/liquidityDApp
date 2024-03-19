//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Liquidity {
    address public admin;

    mapping(address => LiquidityInfo[]) public liquidities;
    uint256 public liquidityID;

    struct LiquidityInfo {
        uint256 id;
        address owner;
        string tokenA;
        string tokenB;
        string tokenA_Address;
        string tokenB_Address;
        string poolAddress;
        string network;
        string transactionHash;
        uint256 timeCreated;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }
}
