// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "./Fundraiser.sol";

contract FundraiserFactory {
    event FundraiserCreated(address indexed fundraiserAddress);

    mapping(address => Fundraiser[]) fundraisers;
    
    // todo: document
    function createFundraiser() public returns (address) {
        Fundraiser fundraiser = new Fundraiser();
        fundraisers[msg.sender].push(fundraiser); // todo: test
        emit FundraiserCreated(address(fundraiser));
        return address(fundraiser); // todo: test
    }

    // todo: document
    function getFundraisersByAddress(address creator) public view returns (Fundraiser[] memory) {
        return fundraisers[creator]; // todo: test
    }
}
