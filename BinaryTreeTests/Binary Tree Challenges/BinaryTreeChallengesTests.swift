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
        let tree = makeBinaryTree2()
        
        let result = sut.height(of: tree)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_serialization_Challenge2() {
        let sut = BinaryTreeChallenge_2_Serialization<Int>()
        let tree = makeBinaryTree2()
        
        let serialization = sut.serialize(tree)
        XCTAssertEqual(serialization, [0,1,3,nil,nil,4,nil,nil,2,5,6,nil,nil,nil,nil])
    }
    
    func test_deserialization_Challenge2() {
        let sut = BinaryTreeChallenge_2_Serialization<Int>()
        let tree = makeBinaryTree2()
        
        let serialization = sut.serialize(tree)
        XCTAssertEqual(serialization, [0,1,3,nil,nil,4,nil,nil,2,5,6,nil,nil,nil,nil])
        
        let deserialization = sut.deserialize(serialization)
        XCTAssertEqual(deserialization?.value, 0)
    }
    
    func test_inorderTraversal() {
        let tree = makeBinaryTree1()
        let sut = BinaryTreeChallenge_3_Traversals<Int>()
        
        let result = sut.inorderTraversal(tree)
        
        XCTAssertEqual(result, [0,1,5,7,8,9])
    }
    
    func test_preorderTraversal() {
        let tree = makeBinaryTree1()
        let sut = BinaryTreeChallenge_3_Traversals<Int>()
        
        let result = sut.preorderTraversal(tree)
        
        XCTAssertEqual(result, [7,1,0,5,9,8])
    }

    func test_postorderTraversal() {
        let tree = makeBinaryTree1()
        let sut = BinaryTreeChallenge_3_Traversals<Int>()
        
        let result = sut.postorderTraversal(tree)
        
        XCTAssertEqual(result, [0,5,1,8,9,7])
    }
    
    private func makeBinaryTree1() -> BinaryTreeNode<Int> {
        let zero = BinaryTreeNode(value: 0)
         let one = BinaryTreeNode(value: 1)
         let five = BinaryTreeNode(value: 5)
         let seven = BinaryTreeNode(value: 7)
         let eight = BinaryTreeNode(value: 8)
         let nine = BinaryTreeNode(value: 9)

         seven.leftChild = one
         one.leftChild = zero
         one.rightChild = five
         seven.rightChild = nine
         nine.leftChild = eight

         return seven
    }
    
    private func makeBinaryTree2() -> BinaryTreeNode<Int> {
     
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
