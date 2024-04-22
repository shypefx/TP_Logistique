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

    constructor() {
        whitelist[msg.sender] = true;
    }

    function addWhitelistMember(address newMember) public isWhitelisted {
        require(!whitelist[newMember], "Member already whitelisted");
        whitelist[newMember] = true;
        emit WhitelistUpdated(newMember, true);
    }

    function updateWhitelist(address participant, bool boolWhitelisted) public onlyOwner {
        require(whitelist[participant] != boolWhitelisted, "No change required");
        whitelist[participant] = boolWhitelisted;
        emit WhitelistUpdated(participant, boolWhitelisted);
    }
}
