// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import '@openzeppelin/contracts/token/ERC721/IERC721.sol';

import 'forge-std/Test.sol';

import {CostaRicaWorkshop2022} from '../src/CostaRicaWorkshop2022.sol';

contract ForkWorkshopTest is Test {
    IERC721 public workshop = IERC721(0xb6D8776D3beaEbC4511db37D81f8829483Fc0f1d);

    address payable internal alice = payable(makeAddr('alice'));
    address payable internal bob = payable(makeAddr('bob'));

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    function setUp() public {
        vm.label(alice, 'alice');
        vm.label(bob, 'bob');
    }

    /* ============ External Write Functions ============ */

    /* ============ Mint ============ */

    /* ============ BalanceOf ============ */
    // test that balanceOf of NFT with id 0 is 0x48d21Dc6BBF18288520E9384aA505015c26ea43C
    function testBalanceOf() public {
        uint256 tokenId = 0;
        address owner = workshop.ownerOf(tokenId);
        assertEq(owner, 0x48d21Dc6BBF18288520E9384aA505015c26ea43C);
    }

    /* ============ External View Functions ============ */
}
