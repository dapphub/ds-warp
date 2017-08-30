// Copyright (C) 2017  DappHub, LLC

// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND (express or implied).

pragma solidity ^0.4.13;

import "ds-test/test.sol";
import "./warp.sol";

contract DSWarpTest is DSTest {
    DSWarp warp;

    function setUp() {
        warp = new DSWarp();
    }
    function testInit() {
        assertEq(warp.era(), now);
    }
    function testWarp() {
        var tic = now;
        warp.warp(1);
        assertEq(warp.era(), tic + 1);
    }
    function testWarpLock() {
        warp.warp(0);
        assertEq(warp.era(), now);
    }
    function testFailAfterWarpLock() {
        warp.warp(0);
        warp.warp(1);
    }
}
