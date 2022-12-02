// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import 'forge-std/Test.sol';
import {CostaRicaWorkshop2022} from '../src/CostaRicaWorkshop2022.sol';

contract CounterTest is Test {
    CostaRicaWorkshop2022 public workshop;

    function setUp() public {
        workshop = new CostaRicaWorkshop2022();
    }
}
