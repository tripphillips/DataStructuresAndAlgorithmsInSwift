//
//  BinaryTreeChallengesTests.swift
//  BinaryTreeTests
//
//  Created by Trip Phillips on 5/5/22.
//

import Foundation
import XCTest
@testable import BinaryTree

class BinaryTreeChallengesTests: XCTestCase {
    
    func test_heightOfATree_Challenge1() {
        let sut = BinaryTreeChallenge_1_HeightOfATree<Int>()
        let tree = makeBinaryTree()
        
        let result = sut.height(of: tree)
        
        XCTAssertEqual(result, 3)
    }
    
    private func makeBinaryTree() -> BinaryTreeNode<Int> {
     
        let root = BinaryTreeNode(value: 0)
        
        let left = BinaryTreeNode(value: 1)
        let right = BinaryTreeNode(value: 2)
        
        let left2 = BinaryTreeNode(value: 3)
        let left3 = BinaryTreeNode(value: 4)
        
        let right2 = BinaryTreeNode(value: 5)
        let right3 = BinaryTreeNode(value: 6)
        
        
        root.leftChild = left
        root.rightChild = right
        
        left.leftChild = left2
        left.rightChild = left3
        
        right.leftChild = right2
        right2.leftChild = right3
        
        return root
    }
}
