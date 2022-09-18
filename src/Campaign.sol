// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;
// todo: make camapaign ownable
import "openzeppelin/access/Ownable.sol";

contract Campaign is Ownable {
    uint256 public immutable id;

    constructor(uint256 id_ /**, address owner */) {
        id = id_;
        // transferOwnership(owner);
    }
}
