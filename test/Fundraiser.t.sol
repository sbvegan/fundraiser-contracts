// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "forge-std/Test.sol";
import "../src/FundraiserFactory.sol";

contract FundraiserTest is Test {
    FundraiserFactory fundraiserFactory;
    event FundraiserCreated(address indexed fundraiserAddress);

    function setUp() public {
        fundraiserFactory = new FundraiserFactory();
    }

    function testFundraiserCreationEmit() public {
        // the fundraiser address is difficult to determine, so I am just
        // just checking that the event is emitted
        vm.expectEmit(false, false, false, false);
        // The event we expect
        emit FundraiserCreated(address(0));
        // The event we get
        fundraiserFactory.createFundraiser();
    }

    // todo: finish
    function testFundraiserMappingUpdated() public {
        fundraiserFactory.createFundraiser();
    }
}
