// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FavoriteNumber {
    uint256 myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    
    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // Deploying contract from another contract

    contract StorageFactory{
        // Solidity is case-sensitive (SimpleStorage and simpleStorage - different)
        SimpleStorage public simpleStorage;         
        function createStorageContract() public {
            simpleStorage = new SimpleStorage();
        }
    }
}