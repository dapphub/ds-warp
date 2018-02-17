// warp.t.sol - test for warp.sol

// Copyright (C) 2017  DappHub, LLC

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

pragma solidity ^0.4.13;

import "ds-test/test.sol";
import "./warp.sol";

contract DSWarpTest is DSTest {
    DSWarp warp;

    function setUp() public {
        warp = new DSWarp();
    }
    function testInit() public {
        assertEq(warp.era(), now);
    }
    function testWarp() public {
        var tic = now;
        warp.warp(1);
        assertEq(warp.era(), tic + 1);
    }
    function testWarpLock() public {
        warp.warp(0);
        assertEq(warp.era(), now);
    }
    function testFailAfterWarpLock() public {
        warp.warp(0);
        warp.warp(1);
    }
}
