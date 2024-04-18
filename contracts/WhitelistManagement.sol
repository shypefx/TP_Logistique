// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./OwnershipManagement.sol";

contract WhitelistManagement is OwnershipManagement {
    mapping(address => bool) public whitelist;

    event WhitelistUpdated(address indexed participant, bool status);

    modifier isWhitelisted() {
        require(whitelist[msg.sender], "Not whitelisted");
        _;
    }

    function updateWhitelist(address participant, bool whitelisted_bool) public onlyOwner {
        whitelist[participant] = whitelisted_bool;
        emit WhitelistUpdated(participant, whitelisted_bool);
    }

    // onlyWhitelist could add personn
    // OnlyOwner is allow to remove or update the list
}
