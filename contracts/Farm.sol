// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Farm {
    enum FarmStatus {
        Pending,
        Active,
        Completed
    }

    uint256 public id;
    address public owner;
    uint256 public quantity;
    uint256 public sold;
    FarmStatus public status;
    string public description;
    string public name;
    string public symbol;

    mapping(address => uint256) investors;

    event Investment(address indexed investor, uint256 quantity);

    constructor(
        uint256 _id,
        uint256 _quantity,
        address _owner,
        string memory _description,
        string memory _name,
        string memory _symbol
    ) {
        id = _id;
        owner = _owner;
        quantity = _quantity;
        description = _description;
        name = _name;
        symbol = _symbol;
    }

    function available() public view returns (uint256) {
        return quantity - sold;
    }

    function balanceOf(address _owner) external view returns (uint256) {
        return investors[_owner];
    }

    function buyStake(uint256 _quantity) external {
        require(available() >= _quantity);
        investors[msg.sender] += _quantity;
        emit Investment(msg.sender, _quantity);
    }
}
