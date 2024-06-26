// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Register {
    string mesaj = "Hello, Ethereum!";
    
    function getMessage() public view returns (string memory) {
        return mesaj;
    }

    function setMessage(string memory yeniMesaj) public {
        mesaj = yeniMesaj;
    }
}