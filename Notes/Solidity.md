# Solidity

## Introduction

Solidity is a programming language specifically designed for writing smart contracts on blockchain platforms, particularly 
Ethereum. Smart contracts are the self-executing contracts with terms of agreement between buyer and seller being directly
written in code. 
Characteristics: -
1. Turing completeness - Solidity can express any computations that can be algorithmically computed. This allows for 
   implementation of complex logic and algorithms within smart contracts.
2. Immutable smart contracts - The code and state cannot be altered or tampered with once deployed, providing transparency and 
   trust in execution of contractual agreements.
3. Gas fees - Gas fees are paid in cryptocurrency (e.g., Ether on Ethereum) to compensate for computational resources consumed 
   by smart contracts execution. Solidity developers need to minimize gas usage and optimize cost-efficiency.
4. Development ecosystem - The development environments include Remix IDE, Truffle, Hardhat and Foundary, as well as libraries 
   for commmon functionalities like token standards (e.g. ERC-20, ERC-721)

Hello World program:-

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract HelloWorld {
    string public greet = "Hello World!";
}

Terms uesd in above program:-
1. SPDX License Identifier - SPDX stands for Software Package Data Exchange, and it's a standard format used to declare 
   licenses associated with software projects. In this case, the license is declared as MIT, indicating that the code is licensed under the terms of the MIT License, which is a permissive open-source license.
2. Pragma directive - The pragma directive specifies compiler settings and version constraints. In this case, it indicates 
   that the Solidity compiler version used must be greater than or equal to 0.8.24 and less than 0.9.0. 
3. Contract definition - This defines a Solidity contract named 'HelloWorld'. The contract can be interacted with by sending 
   transactions to its address.
4. State variables - This line declares a state variable named greet of type string. State variables store data on the 
   blockchain and persist between function calls. In this case, greet is marked as public, which means it can be accessed outside the contract and has an automatically generated getter function.
   The initial value of greet is set to "Hello World!".


### Primitive Data Types:

1. Boolean (bool):-
   - Represent boolean value, which can be either 'true' or 'false'
   - Example:
        bool isReady = true;

2. 