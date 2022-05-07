//
//  BinarySearchTreeTests.swift
//  BinarySearchTreeTests
//
//  Created by Trip Phillips on 5/7/22.
//

import XCTest
import BinaryTree
@testable import BinarySearchTree

class BinarySearchTreeTests: XCTestCase {

    func test_insert_BinarySearchTreeUnbalanced() {
        
        let sut = makeSUT()
        
        XCTAssertEqual(valueAtLevel(0, currentLevel: 0, left: false, node: sut.root), 0)
        XCTAssertEqual(valueAtLevel(1, currentLevel: 0, left: true, node: sut.root), nil)
        XCTAssertEqual(valueAtLevel(1, currentLevel: 0, left: false, node: sut.root), 1)
        XCTAssertEqual(valueAtLevel(2, currentLevel: 0, left: true, node: sut.root), nil)
        XCTAssertEqual(valueAtLevel(2, currentLevel: 0, left: false, node: sut.root), 2)
        XCTAssertEqual(valueAtLevel(3, currentLevel: 0, left: true, node: sut.root), nil)
        XCTAssertEqual(valueAtLevel(3, currentLevel: 0, left: false, node: sut.root), 3)
        XCTAssertEqual(valueAtLevel(4, currentLevel: 0, left: true, node: sut.root), nil)
        XCTAssertEqual(valueAtLevel(4, currentLevel: 0, left: false, node: sut.root), 4)
        XCTAssertEqual(valueAtLevel(5, currentLevel: 0, left: true, node: sut.root), nil)
        XCTAssertEqual(valueAtLevel(5, currentLevel: 0, left: false, node: sut.root), 5)
    }
    
    func test_insert_BinarySearchTreeBalanced() {
        
        let sut = makeSUT(balanced: true)
        
        XCTAssertEqual(valueAtLevel(0, currentLevel: 0, left: false, node: sut.root), 3)
        XCTAssertEqual(valueAtLevel(1, currentLevel: 0, left: true, node: sut.root), 1)
        XCTAssertEqual(valueAtLevel(1, currentLevel: 0, left: false, node: sut.root), 4)
        XCTAssertEqual(valueAtLevel(2, currentLevel: 0, left: true, node: sut.root), 0)
        XCTAssertEqual(valueAtLevel(2, currentLevel: 0, left: false, node: sut.root), 5)
    }
    
    func test_contains_BinarySearchTreeUnbalanced() {
        
        let sut = makeSUT()
        
        XCTAssertTrue(sut.contains(5))
    }
    
    func test_contains_BinarySearchTreeBalanced() {
        
        let sut = makeSUT(balanced: true)
        
        XCTAssertTrue(sut.contains(5))
    }
    
    func test_contains_BinarySearchTreeUnbalancedNotContaining() {
        
        let sut = makeSUT()
        
        XCTAssertFalse(sut.contains(10))
    }
    
    func test_contains_BinarySearchTreeBalancedNotContaining() {
        
        let sut = makeSUT(balanced: true)
        
        XCTAssertFalse(sut.contains(10))
    }
    
    func test_remove_BinarySearchTreeUnbalancedLeaf() {
        
        var sut = makeSUT()
        sut.remove(5)
        XCTAssertFalse(sut.contains(5))
    }
    
    func test_remove_BinarySearchTreeBalancedLeaf() {
        
        var sut = makeSUT(balanced: true)
        sut.remove(5)
        XCTAssertFalse(sut.contains(5))
    }
    
    func test_remove_BinarySearchTreeUnbalancedLeftChild() {
        
        var sut = makeSUT()
        sut.remove(4)
        XCTAssertFalse(sut.contains(4))
    }
    
    func test_remove_BinarySearchTreeBalancedLeftChild() {
        
        var sut = makeSUT(balanced: true)
        sut.remove(4)
        XCTAssertFalse(sut.contains(4))
    }
    
    func test_remove_BinarySearchTreeUnbalancedRight() {
        
        var sut = makeSUT()
        sut.remove(1)
        XCTAssertFalse(sut.contains(1))
    }
    
    func test_remove_BinarySearchTreeBalancedRightChild() {
        
        var sut = makeSUT(balanced: true)
        sut.remove(1)
        XCTAssertFalse(sut.contains(1))
    }
    
    func test_remove_BinarySearchTreeUnbalancedTwoChildren() {
        
        var sut = makeSUT()
        sut.remove(3)
        XCTAssertFalse(sut.contains(3))
        XCTAssertEqual(sut.root?.value, 0)
    }
    
    func test_remove_BinarySearchTreeBalancedTwoChildren() {
        
        var sut = makeSUT(balanced: true)
        sut.remove(3)
        XCTAssertFalse(sut.contains(3))
        XCTAssertEqual(sut.root?.value, 4)
    }
    
    private func valueAtLevel(_ level: Int,
                              currentLevel: Int,
                              left: Bool,
                              node: BinaryTreeNode<Int>?) -> Int? {
        guard level != currentLevel else { return node?.value }
        return valueAtLevel(level, currentLevel: currentLevel + 1, left: left, node: left ? node?.leftChild : node?.rightChild)
    }
    
    private func makeSUT(balanced: Bool = false) -> BinarySearchTree<Int> {
        var bst = BinarySearchTree<Int>()
        if balanced {
            bst.insert(3)
            bst.insert(1)
            bst.insert(4)
            bst.insert(0)
            bst.insert(2)
            bst.insert(5)
        } else {
            for i in 0...5 {
                bst.insert(i)
            }
        }
        print(bst)
        return bst
    }
}
