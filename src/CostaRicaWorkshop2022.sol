// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/utils/Counters.sol';

/*
 ______     ______     ______     ______   ______        ______     __     ______     ______    
/\  ___\   /\  __ \   /\  ___\   /\__  _\ /\  __ \      /\  == \   /\ \   /\  ___\   /\  __ \   
\ \ \____  \ \ \/\ \  \ \___  \  \/_/\ \/ \ \  __ \     \ \  __<   \ \ \  \ \ \____  \ \  __ \  
 \ \_____\  \ \_____\  \/\_____\    \ \_\  \ \_\ \_\     \ \_\ \_\  \ \_\  \ \_____\  \ \_\ \_\ 
  \/_____/   \/_____/   \/_____/     \/_/   \/_/\/_/      \/_/ /_/   \/_/   \/_____/   \/_/\/_/ 
 */

/// @custom:security-contact to@ylv.io
contract CostaRicaWorkshop2022 is ERC721, Ownable {
    using Counters for Counters.Counter;

    /* ============ Storage ============ */
    Counters.Counter private _tokenIdCounter;

    /* ============ Constants ============ */

    /* ============ Immutables ============ */
    uint256 public immutable eventEndsTS;
    uint256 public immutable eventStartsTS;

    /* ============ Events ============ */

    /* ============ Constructor ============ */

    constructor() ERC721('CostaRicaWorkshop2022', 'CRW') {
        eventStartsTS = block.timestamp;
        eventEndsTS = block.timestamp + 1 days;
    }

    /* ============ Modifiers ============ */
    modifier isEventOpen() {
        require(block.timestamp < eventEndsTS, 'Event is not open');
        _;
    }

    modifier isEventOver() {
        require(block.timestamp > eventEndsTS, 'Event is not over');
        _;
    }

    /* ============ External Write Functions ============ */

    function mint(address to) public isEventOpen {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    /* ============ External View Functions ============ */

    /* ============ Internal View Functions ============ */
}
