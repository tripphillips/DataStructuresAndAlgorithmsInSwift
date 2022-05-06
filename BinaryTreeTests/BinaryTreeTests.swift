//
//  BinaryTreeTests.swift
//  BinaryTreeTests
//
//  Created by Trip Phillips on 5/5/22.
//

import XCTest
@testable import BinaryTree

class BinaryTreeTests: XCTestCase {
    
    func test_inorderTraversal() {
        let sut = makeSUT()
        var result = [Int]()
        
        sut.inorderTraversal { value in
            result.append(value)
        }
        
        XCTAssertEqual(result, [0,1,5,7,8,9])
    }
    
    func test_preorderTraversal() {
        let sut = makeSUT()
        var result = [Int]()
        
        sut.preorderTraversal { value in
            result.append(value)
        }
        
        XCTAssertEqual(result, [7,1,0,5,9,8])
    }

    func test_postorderTraversal() {
        let sut = makeSUT()
        var result = [Int]()
        
        sut.postorderTraversal { value in
            result.append(value)
        }
        
        XCTAssertEqual(result, [0,5,1,8,9,7])
    }
    
    private func makeSUT() -> BinaryTreeNode<Int> {
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

}
