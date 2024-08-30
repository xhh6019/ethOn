pragma solidity ^0.4.0;

contract C {
    uint[] x; // x 的数据存储位置是 storage

    // memoryArray 的数据存储位置是 memory
    function f(uint[] memory memoryArray ) public {
        x = memoryArray; // 将整个数组拷贝到 storage 中，可行
        var y = x;  // 分配一个指针（其中 y 的数据存储位置是 storage），可行
        //尽管var 有这些优点，Solidity 的开发团队最终决定在 0.5.0 版本之后弃用var
        y[7]; // 返回第 8 个元素，可行
        y.length = 2; // 通过 y 修改 x，可行
        delete x; // 清除数组，同时修改 y，可行
        // 下面的就不可行了；需要在 storage 中创建新的未命名的临时数组， /
        // 但 storage 是“静态”分配的：
        // y = memoryArray;
        // 下面这一行也不可行，因为这会“重置”指针，
        // 但并没有可以让它指向的合适的存储位置。
        // delete y;

        g(x); // 调用 g 函数，同时移交对 x 的引用
        h(x); // 调用 h 函数，同时在 memory 中创建一个独立的临时拷贝
        uint[] memory a = new uint[](7);
        //uint[] memory b = new uint[];
        bool[2][] m_pairsOfFlags;
        bool[][2] m_pairsOfFlags2;
    }

    function g(uint[] storage storageArray) internal {}
    function h(uint[] memory memoryArray) public {}
}