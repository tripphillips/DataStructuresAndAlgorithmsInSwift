//
//  AVLTreeTests.swift
//  AVLTreeTests
//
//  Created by Trip Phillips on 5/7/22.
//

import XCTest
@testable import AVLTree

class AVLTreeTests: XCTestCase {
    
    func test_contains_AVLTree() {
        
        let sut = makeSUT()
        
        XCTAssertTrue(sut.contains(5))
    }
    
    func test_contains_AVLTreeNotContaining() {
        
        let sut = makeSUT()
        
        XCTAssertFalse(sut.contains(11))
    }
    
    func test_remove_AVLTreeLeaf() {
        
        var sut = makeSUT()
        sut.remove(5)
        XCTAssertFalse(sut.contains(5))
    }
    
    func test_remove_AVLTreeLeftChild() {
        
        var sut = makeSUT()
        sut.remove(4)
        XCTAssertFalse(sut.contains(4))
    }
    
    func test_remove_AVLTreeRight() {
        
        var sut = makeSUT()
        sut.remove(1)
        XCTAssertFalse(sut.contains(1))
    }
    
    func test_remove_AVLTreeTwoChildren() {
        
        var sut = makeSUT()
        sut.remove(3)
        XCTAssertFalse(sut.contains(3))
        XCTAssertEqual(sut.root?.value, 4)
    }
    
    private func valueAtLevel(_ level: Int,
                              currentLevel: Int,
                              left: Bool,
                              node: AVLNode<Int>?) -> Int? {
        guard level != currentLevel else { return node?.value }
        return valueAtLevel(level, currentLevel: currentLevel + 1, left: left, node: left ? node?.leftChild : node?.rightChild)
    }
    
    private func makeSUT() -> AVLTree<Int> {
        var avlTree = AVLTree<Int>()
        for i in 0...10 {
            avlTree.insert(i)
        }
        print(avlTree)
        return avlTree
    }
}
