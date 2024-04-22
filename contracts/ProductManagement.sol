// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./WhitelistManagement.sol";

contract ProductManagement is WhitelistManagement {

    struct Product {
        string manufacturer;
        uint lotNumber;
        string productName;
        string lotId;
        uint totalProductsInLot;
        address lastOwner;
        uint purchaseDate;
    }

    mapping(string => Product) public products;

    event ProductUpdated(string indexed lotId);

    function addOrUpdateProduct(
        string memory _lotId,
        string memory _manufacturer,
        uint _lotNumber,
        string memory _productName,
        uint _totalProductsInLot,
        address _lastOwner,
        uint _purchaseDate
    ) 
    
    public isWhitelisted {
        products[_lotId] = Product({
            manufacturer: _manufacturer,
            lotNumber: _lotNumber,
            productName: _productName,
            lotId: _lotId,
            totalProductsInLot: _totalProductsInLot,
            lastOwner: _lastOwner,
            purchaseDate: _purchaseDate
        });
        emit ProductUpdated(_lotId);
    }

    function getProduct(string memory _lotId) public view returns (Product memory) {
        return products[_lotId];
    }
}
