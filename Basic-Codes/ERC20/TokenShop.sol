// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

interface TokenInterface {
    function mint(address account, uint256 amount) external;
}

contract Tokenshop {
    AggregatorV3Interface internal priceFeed;
    TokenInterface public minter;
    uint256 public tokenPrice = 200; // 1 token = 2.00 USD
    address public owner;

    constructor(address tokenAddress) {
        minter = TokenInterface(tokenAddress);
        priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306); // ETH/USD price feed address (Sepolia testnet)
        owner = msg.sender;
    }

    function getDatafeedAnswer() public view returns (int) {
        // roundID, price, startedAt, timeStamp, answeredInRound
        ( , int price, , ,) = priceFeed.latestRoundData();
        return price;
    }

    function tokenAmount(uint256 amountETH) public view returns (uint256) {
        uint256 ehtUsd = uint256(getDatafeedAnswer());
        uint256 amountUSD = amountETH * ehtUsd / 10**18;
        uint256 amountToken = amountUSD / tokenPrice / 10**(8/2);
        return amountToken;
    }

    receive() external payable {
        uint256 amountToken = tokenAmount(msg.value);
        minter.mint(msg.sender, amountToken);
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function withdraw() external onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}