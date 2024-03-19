// SPDX-License-Identifier: MIT
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
        string poolAddress; // Changed the type to string as it seems to be intended for a string representation of an address
        string network;
        string transactionHash;
        uint256 timeCreated;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function addLiquidity(
        string memory _tokenA,
        string memory _tokenB,
        string memory _tokenA_Address,
        string memory _tokenB_Address,
        string memory _poolAddress, // Added missing parameter for pool address
        string memory _network, // Added missing parameter for network
        string memory _transactionhash
    ) external {
        liquidityID++;
        uint256 currentLiquidityID = liquidityID;

        liquidities[msg.sender].push(
            LiquidityInfo(
                currentLiquidityID,
                msg.sender,
                _tokenA,
                _tokenB,
                _tokenA_Address,
                _tokenB_Address,
                _poolAddress,
                _network,
                _transactionhash,
                block.timestamp
            )
        );
    }
}
