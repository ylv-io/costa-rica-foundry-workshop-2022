// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import 'forge-std/Test.sol';
import {CostaRicaWorkshop2022} from '../src/CostaRicaWorkshop2022.sol';

contract CounterTest is Test {
    CostaRicaWorkshop2022 public workshop;

    address payable internal alice = payable(makeAddr('alice'));
    address payable internal bob = payable(makeAddr('bob'));

    function setUp() public {
        vm.label(alice, 'alice');
        vm.label(bob, 'bob');

        workshop = new CostaRicaWorkshop2022();
    }

    /* ============ External Write Functions ============ */

    // write a test for mint function
    function testMint() public {
        // prank msg.sender to be alice
        vm.prank(alice);

        workshop.mint(alice);

        assertEq(workshop.balanceOf(alice), 1);
        // check that erc721 token id is equal to 0 using ownerOf method
        assertEq(workshop.ownerOf(0), alice);
    }

    /* ============ External View Functions ============ */
}
