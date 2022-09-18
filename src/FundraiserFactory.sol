// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "./Fundraiser.sol";

contract FundraiserFactory {
    event FundraiserCreated(address indexed fundraiserAddress);

    uint256 public fundraiserIndex;
    Fundraiser[] public fundraisers;
    
    // todo: document
    function createFundraiser() public returns (uint256) {
        Fundraiser fundraiser = new Fundraiser();
        fundraisers.push(fundraiser); // todo: test
        ++fundraiserIndex;
        emit FundraiserCreated(address(fundraiser));
        return fundraiserIndex - 1; // todo: test
    }
}
