// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import 'forge-std/Test.sol';

import {CostaRicaWorkshop2022} from '../src/CostaRicaWorkshop2022.sol';

contract WorkShopTest is Test {
    CostaRicaWorkshop2022 public workshop;

    address payable internal alice = payable(makeAddr('alice'));
    address payable internal bob = payable(makeAddr('bob'));

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    function setUp() public {
        vm.label(alice, 'alice');
        vm.label(bob, 'bob');

        workshop = new CostaRicaWorkshop2022();
    }

    /* ============ External Write Functions ============ */

    /* ============ Mint ============ */

    // write a test for mint function
    function testMint() public {
        // prank msg.sender to be alice
        vm.prank(alice);

        workshop.mint(alice);

        assertEq(workshop.balanceOf(alice), 1);
        // check that erc721 token id is equal to 0 using ownerOf method
        assertEq(workshop.ownerOf(0), alice);
    }

    // test that NFT can not be minted after 24 hours
    function testMintAfter24Hours() public {
        // prank msg.sender to be alice
        vm.prank(alice);

        // advance time by 24 hours
        skip(24 * 3600 + 1);

        // expect mint function to revert
        vm.expectRevert(CostaRicaWorkshop2022.EventIsOver.selector);
        workshop.mint(alice);
    }

    // test that NFT can be minted to bob address by alice
    function testMintToBob() public {
        // prank msg.sender to be alice
        vm.prank(alice);

        workshop.mint(bob);

        assertEq(workshop.balanceOf(bob), 1);
        // check that erc721 token id is equal to 0 using ownerOf method
        assertEq(workshop.ownerOf(0), bob);
    }

    // test that first NFT has id 0 and second NFT has id 1
    function testMintMultiple() public {
        // prank msg.sender to be alice
        vm.prank(alice);

        workshop.mint(alice);
        workshop.mint(alice);

        assertEq(workshop.balanceOf(alice), 2);
        // check that erc721 token id is equal to 0 using ownerOf method
        assertEq(workshop.ownerOf(0), alice);
        // check that erc721 token id is equal to 1 using ownerOf method
        assertEq(workshop.ownerOf(1), alice);
    }

    // test that mint function emits Transfer event
    function testMintEvent() public {
        // prank msg.sender to be alice
        vm.prank(alice);

        // expect Transfer event to be emitted
        vm.expectEmit(true, true, false, true, address(workshop));
        emit Transfer(address(0), address(alice), 0);
        workshop.mint(alice);
    }

    // test that mint can function can mint multiple NFTs for the same address
    function testMintMultipleForSameAddress(uint8 count) public {
        // prank msg.sender to be alice
        vm.prank(alice);

        for (uint256 index = 0; index < count; index++) {
            workshop.mint(alice);
        }

        assertEq(workshop.balanceOf(alice), count);

        for (uint256 index = 0; index < count; index++) {
            assertEq(workshop.ownerOf(index), alice);
        }
    }

    /* ============ External View Functions ============ */
}
