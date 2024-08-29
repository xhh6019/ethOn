pragma solidity >0.4.23 <0.5.0;

contract Keccak256Example {
    function myKeccak256(uint value, bool fake, bytes32 secret) public pure returns (bytes32) {
        return keccak256(value, fake, secret);
    }
}