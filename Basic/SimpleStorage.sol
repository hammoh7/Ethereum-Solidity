// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage {
    // Basic types = boolean, uint, int, address, bytes, strings

    uint yourNumber = 12;
    int myNumber1 = -15;
    uint256 myNumber2 = 55;
    bool myNumber3 = true;
    string myString = "Hello Everyone";
    bytes32 myBytes32 = "Hey, whatsup!";

    // Functions

    uint myNumber; // default value = 0
    function store(uint256 _myNumber) public {
        myNumber = _myNumber;
        myNumber++;
    }
    // view - It just read the state from the blockchain and disallows any modifications
    function retrieveView() public view returns (uint256) {
        return yourNumber;
    }
    // pure - It disallows both read and modifications in state from blockchain
    function retrievePure() public pure returns (uint256) {
        return 10;
    }

    // Arrays and Structs

    struct Person {
        uint256 personNumber;
        string name;
    }
    // Dynamic array
    Person[] public listOfPeople;

    function addPerson(string memory name, uint personNumber) public {
        listOfPeople.push(Person(personNumber, name));
    }

    Person public person = Person(50, "John");
    Person public person1 = Person({personNumber: 100, name: "Tom"});
}
