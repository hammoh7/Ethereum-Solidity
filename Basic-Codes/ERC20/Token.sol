// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract Token is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE"); // restricting access to 'mint' function
    constructor() ERC20("MyToken", "MTK") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }
    // function allowing accounts with MINTER_ROLE to mint new tokens and assign to specifed address.
    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }
    // function overrides default 'decimals' function of ERC-20 contract to set number of decimal places to 2 instead of 18
    function decimals() public pure override returns (uint8) {
        return 2;
    }
}