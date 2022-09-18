// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import {console} from "forge-std/console.sol";
import "forge-std/Test.sol";
import "../src/CampaignFactory.sol";

abstract contract HelperContract {
    address constant TESTER_ADDRESS = 0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84;
    CampaignFactory campaignFactory;
    constructor() {}
}

contract CampaignTest is Test, HelperContract {
    
    event CampaignCreated(address indexed campaignAddress);

    function setUp() public {
        campaignFactory = new CampaignFactory();
    }

    function testCampaignFactoryCreationEmit() public {
        // the fundraiser address is difficult to determine, so I am just
        // just checking that the event is emitted
        vm.expectEmit(false, false, false, false);
        // The event we expect
        emit CampaignCreated(address(0));
        // The event we get
        campaignFactory.createCampaign();
    }

    function testCampaignFactoryIndexUpdated() public {
        uint256 campaignIndexBeforeCall = campaignFactory.campaignIndex();
        uint256 campaignIndexReturnValue = campaignFactory.createCampaign();
        uint256 campaignIndexAfterCall = campaignFactory.campaignIndex();
        assertEq(campaignIndexBeforeCall, campaignIndexReturnValue);
        assertEq(campaignIndexReturnValue + 1, campaignIndexAfterCall);
    }

    function testCampaignIdMatchesFactoryIndex() public {
        uint256 campaignIndex = campaignFactory.createCampaign();
        Campaign campaign = campaignFactory.campaigns(campaignIndex);
        uint256 campaignId = campaign.id();
        assertEq(campaignId, campaignIndex);
    }
}
