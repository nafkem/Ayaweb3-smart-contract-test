// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "@openzeppelin/contracts/utils/Address.sol";

contract MyWallet {
    mapping(address => uint256) public ethBalance;

    constructor() {}

    function deposit() public payable {
        ethBalance[msg.sender] += msg.value;
    }

    function checkBalance(address _userAddress) public view returns (uint256) {
        return ethBalance[_userAddress];
    }

    function withdraw(uint256 _amount) public {
        require(ethBalance[msg.sender] > _amount, "Amount exceeds balance");
        Address.sendValue(payable(msg.sender), _amount);
        ethBalance[msg.sender] -= _amount;
    }
}
