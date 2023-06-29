## Check the address is Externally-Owned Account (EOA) or smart contract


1. extcodesize

`
assembly {
    size := extcodesize(account)
}
`


2. length 

`
addr.code.length > 0
`


3. openzeppelin

[isContract(address account) → bool](https://docs.openzeppelin.com/contracts/2.x/api/utils#Address-isContract-address-)

