pragma solidity ^0.4.16;

library ArrayUtils {
    // 内部函数可以在内部库函数中使用，
    // 因为它们会成为同一代码上下文的一部分
    function map(
        uint256[] memory self,
        function(uint256) pure returns (uint256) f
    ) internal pure returns (uint256[] memory r) {
        r = new uint256[](self.length);
        for (uint256 i = 0; i < self.length; i++) {
            r[i] = f(self[i]);
        }
    }

    function reduce(
        uint256[] memory self,
        function(uint256, uint256) pure returns (uint256) f
    ) internal pure returns (uint256 r) {
        r = self[0];
        for (uint256 i = 1; i < self.length; i++) {
            r = f(r, self[i]);
        }
    }

    function range(uint256 length) internal pure returns (uint256[] memory r) {
        r = new uint256[](length);
        for (uint256 i = 0; i < r.length; i++) {
            r[i] = i;
        }
    }
}

contract Pyramid {
    using ArrayUtils for *;

    function pyramid(uint256 l) public pure returns (uint256) {
        return ArrayUtils.range(l).map(square).reduce(sum);
    }

    function square(uint256 x) internal pure returns (uint256) {
        return x * x;
    }

    function sum(uint256 x, uint256 y) internal pure returns (uint256) {
        return x + y;
    }
}
