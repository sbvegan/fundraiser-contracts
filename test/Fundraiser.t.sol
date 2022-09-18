// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import {console} from "forge-std/console.sol";
import "forge-std/Test.sol";
import "../src/FundraiserFactory.sol";

abstract contract HelperContract {
    address constant TESTER_ADDRESS = 0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84;
    FundraiserFactory fundraiserFactory;
    constructor() {}
}

contract FundraiserTest is Test, HelperContract {
    
    event FundraiserCreated(address indexed fundraiserAddress);

    function setUp() public {
        fundraiserFactory = new FundraiserFactory();
    }

    function testFundraiserFactoryCreationEmit() public {
        // the fundraiser address is difficult to determine, so I am just
        // just checking that the event is emitted
        vm.expectEmit(false, false, false, false);
        // The event we expect
        emit FundraiserCreated(address(0));
        // The event we get
        fundraiserFactory.createFundraiser();
    }

    function testFundraiserFactoryIndexUpdated() public {
        uint256 fundraiserIndexBeforeCall = fundraiserFactory.fundraiserIndex();
        uint256 fundraiserIndexReturnValue = fundraiserFactory.createFundraiser();
        uint256 fundraiserIndexAfterCall = fundraiserFactory.fundraiserIndex();
        assertEq(fundraiserIndexBeforeCall, fundraiserIndexReturnValue);
        assertEq(fundraiserIndexReturnValue + 1, fundraiserIndexAfterCall);
    }

    function testFundriaserIdMatchesFactoryIndex() public {
        uint256 fundraiserIndex = fundraiserFactory.createFundraiser();
        Fundraiser fundraiser = fundraiserFactory.fundraisers(fundraiserIndex);
        uint256 fundraiserId = fundraiser.id();
        assertEq(fundraiserIndex, fundraiserId);
    }
}
