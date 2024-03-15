// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/*
Inheritance - To inherit properties of SimpleStorage contract. In that for every favourite number, add 1 to that no.
*/
import {FavoriteNumber} from "./FavoriteNumber.sol";
contract ArithmeticStorage is FavoriteNumber {
    // So in the function 'store' we want to do +3 for every favourite number
    // So we will do overriding
    function store(uint256 newNumber) public override {
        myFavoriteNumber = newNumber;
    }
}