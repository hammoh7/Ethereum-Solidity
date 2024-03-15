// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {FavoriteNumber} from "./FavoriteNumber.sol"; // To import single contract from a particular file

contract StorageFactory {
    SimpleStorage public simpleStorage;
    function createStorageContract() public {
        simpleStorage = new SimpleStorage();
    }

    /* 
    ABI - Application Binary Interface
    An interpreter that facilitates communication with EVM bytecode. The solidity ABI is a human-readable list of methods 
    on smart contract for executing a particular function.
    */

    SimpleStorage[] public simpleStorageList;
    function generateStorageContract() public {
        SimpleStorage newSimpleStorage = new SimpleStorage();
        simpleStorageList.push(newSimpleStorage);
    }
    function storageFactoryStore(
        uint256 storageIndex,
        uint256 storageNumber
    ) public {
        simpleStorageList[storageIndex].store(storageNumber);
    }
    function storageFactory(
        uint256 storageNumber
    ) public view returns (uint256) {
        return simpleStorageList[storageNumber].retrieve();
    }
}
