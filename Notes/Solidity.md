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
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract HelloWorld {
    string public greet = "Hello World!";
}
```
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

2. Integer types:-
   - Unsigned intgers (uint) - These are non-negative whole numbers of various sizes. It can be further specified with the 
     number of bits, such as uint8, uint16, uint256, etc. 
   - Signed integers (int) - These are whole numbers that can be positive, negative or zero of various sizes. It can also be 
     further specified with the number of bits, such as int8, int16, int256, etc.
   - Example:
      ```
      uint256 positiveNumber = 100;
      int32 temperature = -10;
      ```

3. Address:-
   - Represents 20-byte Ethereum address
   - Used to store addresses of contracts or external accounts
   - Example:
      address payable recipient = 0x1234567890123456789012345678901234567890;

4. Fixed Point Numbers:-
   - Represents fixed-point numbers with decimal places
   - fixed - Signed fixed-point number
   - unfixed - Unsigned fixed-point number
   - Example:
      ```
      fixed constant PI = 3.14159265358979323846;
      ufixed constant HALF = 0.5;
      ```   
5. Address types:-
   - Address payable - Similar to 'address' type but also allows sending ether and calling functions via 'transfer' and 'send' 
     functions.
   - Example:
      ```
      address owner = 0x1234567890123456789012345678901234567890;
      address payable recipient = payable(owner);
      ```

### Variables

Variables are used to store and manipulate data within smart contracts. Variables can be declared at different scopes, including local, state and global scopes.

1. Local variables:-
   - Local variables are declared within a function or a code block and are only accessible within that function or block.
   - They are typically used for temporary storage of data during the execution of a specific function.
   - Local variables are not stored on the blockchain and are discarded once the function execution is complete.
   - Example:
      ```
      function calculate(uint256 a, uint256 b) public pure returns (uint256) {
         uint256 result = a + b; // Local variable
         return result;
      }
      ```
2. State variables:-
   - State variables are declared at the contract level and are stored permanently on the blockchain.
   - They represent the state of the contract and its data that persists between function calls.
   - State variables can be accessed and modified by any function within the contract.
   - State variables are often used to store contract data such as balances, settings, or other persistent information.
   - Example:
      ```
      contract Bank {
         address public owner; // State variable
         uint256 public balance; // State variable
         constructor() {
            owner = msg.sender;
            balance = 0;
         }
         function deposit(uint256 amount) public {
            balance += amount;
         }
         function withdraw(uint256 amount) public {
            require(balance >= amount, "Insufficient balance");
            balance -= amount;
         }
      }
      ```
3. Global variables:-
   - Global variables in Solidity refer to predefined variables that provide information about the blockchain, transaction, 
     and contract environment.
   - They are accessible from any function within the contract.
   - Examples of global variables include msg.sender, msg.value, block.timestamp, block.number, etc.
   - Example:
      ```
      contract Example {
         function getCurrentTimestamp() public view returns (uint256) {
            return block.timestamp; // Accessing global variable
         }
         function getSender() public view returns (address) {
            return msg.sender; // Accessing global variable
         }
      }
      ```

### Constants

Constants are variables whose values cannot be changed after initialization. They are useful for defining values that are known at compile-time and are intended to remain constant throughout the execution of the contract.

1. Global constants:-
   - Global constants are initialized once and cannot be modified afterward. They can be accessible from anywhere.
   - Example:
      ```
      pragma solidity ^0.8.0;
      contract MyContract {
         uint256 public constant MAX_VALUE = 100;
         function getValue() public pure returns (uint256) {
            return MAX_VALUE;
         }
      }
      ```
2. Function constants:-
   - Function constants are evaluated at compile-time and cannot be modified during execution. They are only accessible within 
     the function where they are declared.
   - Example:
      ```
      pragma solidity ^0.8.0;
      contract MyContract {
         function calculate(uint256 a, uint256 b) public pure returns (uint256) {
            constant uint256 MULTIPLIER = 2;
            return a * b * MULTIPLIER;
         }
      }
      ```

### Ether and Wei

Transactions are paid with ether
1 ether = 10^18 (1e18) wei


### Gas

Gas:-
- Gas is a unit of computation used to measure the work done by the Ethereum network in processing transactions and executing 
  smart contracts.
- Each operation in a transaction consumes a certain amount of gas, and the total gas used determines the cost of the 
  transaction.
- You pay for gas consumed by multiplying the gas used by the gas price (in ether).
- Transactions with higher gas prices have higher priority for inclusion in a block.
- Unspent gas is refunded to the sender.

Gas limit:-
- Gas limit is the maximum amount of gas you're willing to spend for your transaction, set by you.
- It prevents runaway computations and protects against infinite loops by limiting the resources allocated to a transaction.
- If a transaction exceeds its gas limit, it fails, and any state changes made are reverted.
- Block gas limit is the maximum amount of gas allowed in a block, set by the network.
- It ensures the stability and security of the Ethereum network by limiting the total computational load per block.


### Else if statement
Syntax:-
```
if (condition1) {
    // code to execute if condition1 is true
} else if (condition2) {
    // code to execute if condition2 is true
} else {
    // code to execute if none of the above conditions are true
}
```


### For-loop and While-loop

1. For loop:- The for loop is used when you know how many times you want to iterate over a block of code.
   ```
   for (initialization; condition; iteration) {
      // code to execute repeatedly
   }
   ```
2. While loop:- The while loop is used when you want to execute a block of code repeatedly as long as a specified condition is 
   true.
   ```
   while (condition) {
      // code to execute repeatedly
   }
   ```


### Mapping

- Mappings are declared using the syntax mapping(keyType => valueType).
- keyType can be any built-in value type, bytes, string, or any contract.
- valueType can be any type, including another mapping or an array.
- Mappings are not iterable, meaning you cannot directly iterate over their keys or values.

- In the provided Solidity contract Mapping, there is a mapping from addresses to unsigned integers 
  (mapping(address => uint256)).

- In the NestedMapping contract, there is a nested mapping from addresses to mappings from unsigned integers to boolean values 
  (mapping(address => mapping(uint256 => bool))).


### Array

- Arrays can have a compile-time fixed size or a dynamic size.
- They can store elements of any data type, including built-in value types, bytes, strings, or even other contracts.
- Arrays can be declared using the syntax type[], where type represents the data type of the elements.
- Examples:
   uint256[] public arr; declares a dynamic array of unsigned integers.
   uint256[10] public myFixedSizeArr; declares a fixed-size array of unsigned integers with a length of 10.

- Initialization:
   uint256[] public arr2 = [1, 2, 3];

- Accessing arrays:-
   Elements in an array can be accessed and modified using index notation (arr[index]).

- Solidity provides functions to push, pop, and remove elements from arrays:
   push(uint256 i) adds an element to the end of the array.
   pop() removes the last element from the array.
   delete arr[index] removes the element at the specified index and resets its value to the default value.


### Enums

An enum (short for enumeration) is a user-defined data type that consists of a set of named constants called enumerators. Enums are used to define a list of possible values for a variable, where each value represents a distinct state or option.

- Enums are declared using the enum keyword followed by the name of the enum. Inside the enum declaration, you specify a list 
  of named constants, each separated by a comma.
   ```
   enum Status {
      Pending,
      Approved,
      Rejected
   }
   ```
- Values:-
   Enumerators in an enum are implicitly assigned integer values starting from 0.
   You can explicitly assign custom integer values to enumerators if needed.
   If a custom value is not assigned, the enumerator's value increments by 1 from the previous one.
- Usage:-
   Enums are typically used to represent state transitions or categorical options in smart contracts.
   Example -
   ```
   contract Document {
      enum Status {
         Draft,
         Final,
         Archived
      }
      Status public documentStatus;
      function setStatus(Status _status) public {
         documentStatus = _status;
      }
   }
   ```

