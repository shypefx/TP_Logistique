// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./OwnershipManagement.sol";
import "./WhitelistManagement.sol";
import "./ProductManagement.sol";

contract ProductTraceability is OwnershipManagement, WhitelistManagement, ProductManagement {
    
    constructor() {
        owner = msg.sender;
    }
}
