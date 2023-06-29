// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/ContractSize.sol";

contract ContractSizeTest is Test {
    ContractSize public contractSize;
    FailedAttack public failedAttack;
    Attack public attack;

    function setUp() public {
        contractSize = new ContractSize();
        failedAttack = new FailedAttack();        
    }

    function testFailedAttack() public {
        failedAttack.check(address(contractSize));
    }

    function testAttack() public {
        attack = new Attack(address(contractSize));
        assertEq(attack.isContract(), false);
    }

}
