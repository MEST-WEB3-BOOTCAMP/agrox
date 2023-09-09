// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./Farm.sol";
import "./Counter.sol";

contract FarmsController {
    using Counter for Counter.State;
    Counter.State private farmIds;
    address owner = msg.sender;
    mapping(uint => Farm) private farms;

    event FarmAdded(uint256 id);

    function createFarm(
        uint256 _quantity,
        address _owner,
        string memory _description,
        string memory _name,
        string memory _symbol
    ) external {
        uint256 _id = farmIds.next();
        farms[_id] = new Farm(
            _id,
            _quantity,
            _owner,
            _description,
            _name,
            _symbol
        );

        emit FarmAdded(_id);
    }

    function investInFarm(uint256 _farmId, uint256 _quantity) external {
        Farm farm = farms[_farmId];
        farm.buyStake(_quantity);
    }
}
