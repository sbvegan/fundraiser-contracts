// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "./Campaign.sol";

contract CampaignFactory {
    event CampaignCreated(address indexed campaignAddress);

    uint256 public campaignIndex;
    Campaign[] public campaigns;
    
    // todo: document
    function createCampaign() public returns (uint256) {
        Campaign fundraiser = new Campaign(campaignIndex);
        campaigns.push(fundraiser); 
        ++campaignIndex;
        emit CampaignCreated(address(fundraiser));
        return campaignIndex - 1; 
    }
}
