//
//  BinarySearchTreeChallengesTests.swift
//  BinarySearchTreeTests
//
//  Created by Trip Phillips on 5/7/22.
//

import Foundation
import XCTest
import BinaryTree
@testable import BinarySearchTree

class BinarySearchTreeChallengesTests: XCTestCase {
    
    func test_isBinarySearchTree_balancedTree() {
        let sut = makeSUT(balanced: true)
        
        XCTAssertTrue(sut.root!.isBinarySeachTree)
    }
    
    func test_eqaulityBetweenBSTs() {
        let sut1 = makeSUT()
        let sut2 = makeSUT()
        
        XCTAssertTrue(sut1 == sut2)
    }
    
    func test_eqaulityBetweenBSTsNotEqual() {
        let sut1 = makeSUT()
        let sut2 = makeSUT(balanced: true)
        
        XCTAssertFalse(sut1 == sut2)
    }
    
    func test_containsSubTree() {
        let sut = makeSUT()
        var subtree = BinarySearchTree<Int>()
        subtree.insert(1)
        subtree.insert(0)
        subtree.insert(2)
        XCTAssertTrue(sut.contains(subtree))
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
