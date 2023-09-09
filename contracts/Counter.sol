// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

library Counter {
    struct State {
        uint256 _value; // default: 0
    }

    function next(State storage state) internal returns (uint256) {
        state._value += 1;
        return state._value;
    }
}
