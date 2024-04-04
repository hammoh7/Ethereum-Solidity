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


### Structs

A struct is a user-defined data type that allows you to group together related data under a single name. Structs are useful for organizing and managing complex data structures within smart contracts.

- Structs are declared using the struct keyword followed by the name of the struct. Inside the struct declaration, you define 
  a list of fields or members, each with its own data type.
   ```
   struct Todo {
      string text;
      bool completed;
   }
   ```
- Initialization:-
   Structs can be initialized in various ways:
   a. Directly by providing values for each field during declaration.
   b. Using key-value pairs to specify field values.
   c. Initializing an empty struct and then updating its fields individually.
   Example-
   ```
   Person alice = Person("Alice", 30);
   Person bob = Person({name: "Bob", age: 25});
   Person charlie;
   charlie.name = "Charlie";
   charlie.age = 35;
   ```
- Usage:-
   Structs are used to group together related data fields into a single composite data type. They are commonly used to represent entities or objects with multiple attributes in smart contracts.
   Example-
   ```
   struct Person {
      string name;
      uint256 age;
   }
   ```
- Storage and Memory:-
   Structs can be stored in storage or memory, depending on where they are used.
   Structs declared inside functions are stored in memory by default and are temporary.
   Structs declared at the contract level are stored in storage and persist across function calls.
   You can explicitly specify the storage location using storage or memory keywords.
   Example-
      ```
      Person storage person;  // Stored in storage
      Person memory person;   // Stored in memory
      ```


### Storage, Memory and CallData

1. Storage:-
   Variables declared as storage are state variables stored on the blockchain. They persist across function calls and transactions.
   Example-
   ```
   uint256[] public arr;
   mapping(uint256 => address) map;
   ```
2. Memory:-
   Variables declared as memory exist only during the execution of a function call. They are temporary and do not persist between function calls.
   Example-
   ```
   function f() public {
      uint256[] memory myMemArray = new uint256[](10);
   }
   ```
3. Calldata:-
   Calldata is a special data location that contains function arguments and external function call data. It is read-only and cannot be modified by the contract.
   Example-
   ```
   function h(uint256[] calldata _arr) external {
      // Access and use _arr
   }
   ```


### Transient Storage

Transient might refer to data that exists temporarily or is not persisted on the blockchain. 

1. Stack:-
   Solidity does not support dynamic allocation of memory on the stack.
   Primitive data types and fixed-size arrays declared within functions are stored on the stack.
   Stack variables are also temporary and are deallocated once the function execution completes.
   Example-
   ```
   function exampleFunction() public {
      uint256 a; // 'a' exists on the stack
      // Perform operations using 'a'
      // Once the function execution completes, 'a' is deallocated from the stack
   }
   ```
2. Return values:-
   Return values from functions declared as memory or as the return data type are transient, as they only exist during the function execution and are not stored on the blockchain.
   Example-
   ```
   function exampleFunction() public returns (uint256) {
      uint256 result = performCalculation(); // 'result' exists in memory
      return result; // 'result' is returned as the function result
      // Once the function execution completes, 'result' is deallocated from memory
   }
   ```


### Function

Functions in Solidity are essential components of smart contracts that define the behavior and logic of the contract.

1. Return values:-
   Functions can return one or more values using the returns keyword followed by the data types of the returned values.
   Multiple return values can be returned as a tuple. Return values can be named, allowing for more descriptive code.
   Example-
   ```
   function returnMany() public pure returns (uint256, bool, uint256) {
      return (1, true, 2);
   }
   ```
2. Named Returns:-
   Return values can be named, making it clearer what each value represents. Named return values are specified within parentheses after the returns keyword.
   Example:-
   ```
   function named() public pure returns (uint256 x, bool b, uint256 y) {
      return (1, true, 2);
   }
   ```
3. Assigned Returns:-
   Return values can be assigned to their names within the function body without using the return statement explicitly.
   Example-
   ```
   function assigned() public pure returns (uint256 x, bool b, uint256 y) {
      x = 1;
      b = true;
      y = 2;
   }
   ```
4. Destructuring assignments:-
   Destructuring assignment allows for unpacking multiple return values from a function call.
   Values can be assigned to individual variables using a single assignment statement.
   Example-
   ```
   function destructuringAssignments() public pure returns (uint256, bool, uint256, uint256, uint256) {
      (uint256 i, bool b, uint256 j) = returnMany();
      (uint256 x,, uint256 y) = (4, 5, 6);
      return (i, b, j, x, y);
   }
   ```
5. Input and Output types:-
   Public functions in Solidity cannot accept certain data types as inputs or outputs, such as mappings.
   Arrays can be used as both input and output parameters.
   Example-
   ```
   function arrayInput(uint256[] memory _arr) public {}
   function arrayOutput() public view returns (uint256[] memory) {}
   ```
6. Call functions with Key-value inputs:-
   Functions can be called with key-value inputs, providing a more readable way to pass arguments.
   Example-
   ```
   function someFuncWithManyInputs(uint256 x, uint256 y, uint256 z, address a, bool b, string memory c) public pure returns (uint256) {}
   function callFuncWithKeyValue() external pure returns (uint256) {}
   ```
7. View functions:-
   View functions are declared using the view keyword. View functions can read the state but cannot change it.
   They promise not to modify the state of the contract. They are typically used to retrieve and examine data from the contract without altering its state.
   Example-
   ```
   function addToX(uint256 y) public view returns (uint256) {
      return x + y;
   }
   ```
8. Pure functions:-
   Pure functions are declared using the pure keyword. Pure functions are entirely deterministic and operate solely on their input parameters.
   They promise not to modify or read from the state of the contract. They cannot access or modify state variables or call other functions that modify state.
   Example-
   ```
   function add(uint256 i, uint256 j) public pure returns (uint256) {
      return i + j;
   }
   ```

Function Modifier:-
Function modifiers are pieces of code that can be executed before and/or after a function call. They are used to modify the behavior of functions by adding additional checks or operations. 
Modifiers are declared using the modifier keyword followed by a name. Modifiers can contain arbitrary code and typically include conditions or operations to be performed before or after the function execution. Modifiers can be applied to multiple functions within a contract.
Example-
```
modifier onlyOwner() {
    require(msg.sender == owner, "Not owner");
    _; // Execute the rest of the function
}
```
1. Usage:-
   Modifiers are used to enforce access control, validate inputs, guard against reentrancy, or perform any custom checks. They are applied to functions using the modifier keyword followed by the modifier name. Multiple modifiers can be applied to a single function by separating them with spaces.
   Example- 
   ```
   function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
      owner = _newOwner;
   }
   ```
2. Paramters:-
   Modifiers can take parameters, allowing for dynamic behavior based on input values. Parameters are specified within parentheses after the modifier name
   Example-
   ```
   modifier validAddress(address _addr) {
      require(_addr != address(0), "Not valid address");
      _; // Execute the rest of the function
   }
   ```
3. Execution:-
   Modifiers can be executed before and/or after the function body. The underscore (_) symbol is used inside a modifier to indicate where the function body should be executed.
   Example-
   ```
   modifier noReentrancy() {
      require(!locked, "No reentrancy");
      locked = true;
      _; // Execute the function body
      locked = false;
   }
   ```


### Events
Events are mechanism for logging and emitting data to the Ethereum blockchain. They serve various purposes, including updating user interfaces, providing a cheap form of storage, and enabling off-chain applications to react to on-chain events.
Events are declared using the event keyword followed by the event name. They can have zero or more parameters, each with its own data type.
Example-
```
event Log(address indexed sender, string message);
event AnotherLog();
```
1. Event Emission:-
   Events are emitted using the emit keyword followed by the event name and any required parameters.
   Example-
   ```
   function test() public {
      emit Log(msg.sender, "Hello World!");
      emit Log(msg.sender, "Hello EVM!");
      emit AnotherLog();
   }
   ```
2. Indexed parameters:-
   Indexed parameters are marked with the indexed keyword, allowing for efficient filtering of logs based on those parameters.
   Indexed parameters are useful when filtering logs using the indexed keyword in event listeners or when querying logs using tools like web3.js.
   Example- event Log(address indexed sender, string message);
3. Usage:-
   Events are commonly used to provide a historical record of important contract interactions.
   Off-chain applications can listen for these events and react accordingly, updating user interfaces or triggering further actions. Events are a cost-effective way to store information on the blockchain, as they are significantly cheaper than storage operations.
   Example- emit Log(msg.sender, "Hello World!");


### Constructor
A constructor is a special function that gets executed only once when a contract is deployed or created. It is used to initialize the state variables of the contract and perform any necessary setup operations.
A constructor has the same name as the contract and does not have a return type. It is executed automatically upon contract creation.
Example-
```
constructor(string memory _name) {
   name = _name;
}
```
1. Constructor arguments:-
   Constructors can accept arguments just like regular functions. These arguments are used to initialize the state variables of the contract during deployment.
   Example-
   ```
   constructor(string memory _text) {
      text = _text;
   }
   ```
2. Initializing Parent Contracts:-
   In Solidity, a contract can inherit from multiple parent contracts. When initializing parent contracts with arguments, there are two ways to do it:
   Pass the parameters in the inheritance list when declaring the child contract.
   Pass the parameters within the constructor of the child contract.
   Example-
   ```
   contract B is X("Input to X"), Y("Input to Y") {}
   ```
   ```
   contract C is X, Y {
      constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
   }
   ```
3. Order of Constructor execution:-
   When a contract inherits from multiple parent contracts, the constructors of the parent contracts are called in the order of inheritance, regardless of the order in which they are listed in the child contract.
   Example-
   ```
   contract D is X, Y {
      constructor() X("X was called") Y("Y was called") {}
   }
   ```
   ```
   contract E is X, Y {
      constructor() Y("Y was called") X("X was called") {}
   }
   ```


### Inheritance
Inheritance allows contracts to inherit functionalities and state variables from other contracts.
Solidity supports multiple inheritance, where contracts can inherit from one or more parent contracts using the is keyword.
Inheritance creates an "is-a" relationship between contracts, allowing derived contracts to access the functionalities and state variables of their parent contracts.
Example- contract B is A {}
1. Function Override:-
   When a function in a child contract is going to override a function in a parent contract, the function in the parent contract must be declared as virtual.
   The function in the child contract must use the keyword override.
   Example-
   ```
   contract B is A {
      function foo() public pure virtual override returns (string memory) {
         return "B";
      }
   }
   ```
2. Order of inheritance:-
   Contracts should be listed in the order from "most base-like" to "most derived". When a function is called that is defined in multiple parent contracts, the parent contracts are searched from right to left, and in a depth-first manner.
   Example-
   ```
   contract D is B, C {
      function foo() public pure override(B, C) returns (string memory) {
         return super.foo();
      }
   }
   ```
3. Graph of Inheritance:-
   ```
          A
         / \
        B   C
       / \ /
      F  D,E
   ```


### Calling Parent Contracts
Calling parent contracts can be done directly or using the keyword super.
1. Direct Call:-
   Parent contracts can be called directly by their function name.
   Example-
   ```
   function foo() public override {
      A.foo();
   }
   ```
2. Using 'super':-
   The keyword super invokes the function of the immediate parent contract. When using super, all immediate parent contracts' functions will be called in the order of inheritance.
   Example-
   ```
   function bar() public override {
      super.bar();
   }
   ```


### Visibility
Visibility determines the accessibility of functions and state variables to other contracts and accounts.
1. Public:-
   Functions and State variables declared as public can be accessed by any contract or account.
   Example- function publicFunc() public pure returns (string memory)
2. Private:-
   Functions and State variables declared as private can only be accessed within the contract that defines them.
   Example- function privateFunc() private pure returns (string memory)
3. Internal:-
   Functions and state variables declared as internal can be accessed within the contract that defines them and within contracts that inherit from them
   Example- function internalFunc() internal pure returns (string memory)
4. External:-
   Functions declared as external can only be accessed by other contracts and accounts.
   External functions cannot be accessed internally within the contract or by contracts that inherit from them.
   Example- function externalFunc() external pure returns (string memory)


### Interface
An interface is a way to interact with other contracts by declaring a set of functions without implementing them. Interfaces are used to define the external contract's structure, allowing your contract to communicate with it effectively.
1. Features:-
   a. Interfaces cannot have any functions implemented within them.
   b. They can inherit from other interfaces.
   c. All declared functions must be external.
   d. Interfaces cannot declare constructors or state variables.
2. Usage:-
   a. Interfaces serve as blueprint for contracts that your contract needs to interact with.
   b. They define function signatures that external contracts must implement.
   c. Your contract can then utilize these function signatures to call functions from the external contracts.


### Payable
The 'payable' keyword is used to indicate that a function can receive ether and that an address can accept ether transactions.
1. Function:-
   Functions declared as payable can receive ether as part of the function call.
   These functions can accept ether through either direct ether transfers or when called from another contract that sends ether.
2. Addresses:-
   Addresses declared as payable can receive ether through direct transactions or as a result of function calls.
   These addresses are capable of receiving ether transfers, either initiated by external accounts or other contracts.


### Sending Ether (Transfer, Send, Call)

1. transfer:-
   Method - address.transfer(uint256 amount)
   Usage - It sends Ether to specified address
   Gas limit - Limited to 2300 gas
   Behavior - If the transfer fails (e.g., due to out-of-gas), it throws an error, reverting the transaction.
2. send:-
   Method - address.send(uint256 amount) returns (bool)
   Usage - It sends Ether to the specified address.
   Gas limit - Limited to 2300 gas.
   Behavior - It returns value success or failure. If the transfer fails, it returns false without reverting the transaction.
3. call:-
   Method - address.call{value: amount}(bytes memory data) returns (bool, bytes memory)
   Usage - It sends Ether to the specified address and can also invoke a function in the recipient contract.
   Gas limit - It forwards all available gas or allows setting a gas limit.
   Behavior - It returns value success or failure. If the transfer fails, it returns false without reverting the transaction.

To receive Ether in contract, atleast one of the following functions must be present:-
1. receive() - It is called when Ether is sent directly to the contract without any data. It should be declared as receive()  
   external payable.
2. fallback() - It is called when the contract receives Ether and no other function matches the function signature. It should 
   be declared as fallback() external payable.


### Fallback
The fallback function is a special function within a contract that is executed in two main scenarios:
a. When a function that does not exist in the contract is called.
b. When Ether is sent directly to a contract, but there is no receive() function or the msg.data is not empty.

1. Declaration - The fallback function must be declared as fallback() external payable.
2. Execution - When triggered, the fallback function receives any attached Ether and executes logic defined within it. It has 
   gas limit of 2300 when called by 'transfer' or 'send'. However, when called by 'call', it forwards all available gas.
3. Receive function - There is a variant of the fallback function called receive(), which is triggered only when msg.data is 
   empty. This function should also be declared as receive() external payable.
4. Usage - Fallback functions are often used to handle unexpected or arbitrary calls to the contract. They can be useful for 
   implementing custom logic to handle various scenarios, such as logging, state updates, or forwarding Ether.


### Call

In Solidity, call is a low-level function used to interact with other contracts. It allows you to send Ether and trigger functions within another contract. While call can be useful for certain scenarios, such as sending Ether via the fallback function, it is not recommended for calling existing functions within contracts.
1. Usage - The call function is typically used when you want to interact with a contract but do not have access to its source 
   code or ABI. It is commonly used to trigger the fallback function of a contract or to send Ether with custom gas amounts.
2. Syntax - he syntax for using call involves specifying the target contract address, the amount of Ether to send (value), and 
   optionally the gas limit (gas). You can also pass function arguments using abi.encodeWithSignature.
3. Fallback Invocation - When calling a function that does not exist in the target contract, the fallback function is   
   triggered automatically. This can be useful for scenarios where you want to trigger certain behavior based on invalid function calls.

1. Revert Handling: Reverts that occur within the called function are not bubbled up to the caller when using call. This means 
   that errors or exceptions occurring within the called function may not be properly handled.
2. Type Checks Bypassed: When using call, type checks for function arguments are bypassed. This can lead to unexpected     
   behavior or vulnerabilities if the wrong argument types are passed.
3. Function Existence Checks Omitted: When using call to invoke a function, Solidity does not perform checks to verify if the 
   function actually exists in the target contract. This can lead to runtime errors if the function signature is incorrect or if the function does not exist.


### Function Selector
A function selector is the first 4 bytes of calldata that specify which function to call. When you call a function in Solidity, the function signature is hashed using the Keccak-256 hash function, and the first 4 bytes of the hash represent the function selector.
Example-
   ```
   contract FunctionSelector {
    function getSelector(string calldata _func) external pure returns (bytes4) {
         // Keccak-256 hash of the function signature
         bytes32 hash = keccak256(bytes(_func));
         // Take the first 4 bytes of the hash (function selector)
         bytes4 selector = bytes4(hash);
         return selector;
      }
   }
   ```
In this contract, the getSelector function takes a string _func as input, which represents the function signature. It then computes the Keccak-256 hash of the function signature and takes the first 4 bytes of the hash to obtain the function selector.

For example, calling getSelector("transfer(address,uint256)") would return the function selector 0xa9059cbb. Similarly, calling getSelector("transferFrom(address,address,uint256)") would return the function selector 0x23b872dd.


### Try / Catch
try/catch blocks are used to handle errors that occur during external function calls or contract creations.
1. Handling External Function Call Errors:-
   ```
   function tryCatchExternalCall(uint256 _i) public {
      try foo.myFunc(_i) returns (string memory result) {
         emit Log(result);
      } catch {
         emit Log("external call failed");
      }
   }
   ```
2. Handling Contract Creation Errors:-
   ```
   function tryCatchNewContract(address _owner) public {
      try new Foo(_owner) returns (Foo foo) {
         emit Log("Foo created");
      } catch Error(string memory reason) {
         emit Log(reason);
      } catch (bytes memory reason) {
         emit LogBytes(reason);
      }
   }
   ```
