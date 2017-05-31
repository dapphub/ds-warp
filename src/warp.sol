/// warp.sol -- mixin for time travel

// Copyright (C) 2017 Dapphub, LLC

// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND (express or implied).

pragma solidity ^0.4.11;

import "ds-note/note.sol";

contract DSWarp is DSNote {
    uint64  _era;

    function DSWarp() {
        _era = uint64(now);
    }

    function era() constant returns (uint64) {
        return _era == 0 ? uint64(now) : _era;
    }

    function warp(uint64 age) note {
        assert(_era != 0);
        _era = age == 0 ? 0 : _era + age;
    }
}
