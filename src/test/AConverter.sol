pragma solidity >=0.5.8 <0.8.0;

import "../interfaces/IERC20.sol";
import "../interfaces/ERC20.sol";

import "../libraries/SafeMath.sol";
import "../libraries/Address.sol";
import "../libraries/SafeERC20.sol";

import "./AnAsset.sol";

contract AConverter {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;

    event Convert(address to, uint256 amount);
    IERC20 public asset;

    constructor() public {}

    function convert(
        address _from,
        address _to,
        uint256 _amount,
        uint256 _conversionType
    ) external {
        emit Convert(msg.sender, _amount);
        asset.transfer(msg.sender, _amount);
    }

    function setAsset(address _asset) public {
        asset = IERC20(_asset);
    }
}