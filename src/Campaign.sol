// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

contract Campaign {
    uint256 public immutable id;

    constructor(uint256 id_) {
        id = id_;
    }
}