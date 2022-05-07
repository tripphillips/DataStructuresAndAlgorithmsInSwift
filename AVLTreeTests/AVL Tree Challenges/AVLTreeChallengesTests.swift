//
//  AVLTreeChallengesTests.swift
//  AVLTreeTests
//
//  Created by Trip Phillips on 5/7/22.
//

import XCTest
import AVLTree

class AVLTreeChallengesTests: XCTestCase {

    func test_leafCount_EmptyAVLTree() {
        let sut = AVLTree<Int>()
        XCTAssertEqual(sut.leafCount, 0)
    }
    
    func test_leafCount_FilledAVLTree() {
        let sut = makeSUT()
        XCTAssertEqual(sut.leafCount, 4)
    }
    
    func test_nodeCount_EmptyAVLTree() {
        let sut = AVLTree<Int>()
        XCTAssertEqual(sut.nodeCount, 0)
    }
    
    func test_nodeCount_FilledAVLTree() {
        let sut = makeSUT()
        XCTAssertEqual(sut.nodeCount, 7)
    }
    
    private func makeSUT() -> AVLTree<Int> {
        
        var avlTree = AVLTree<Int>()
        for i in 0...6 {
            avlTree.insert(i)
        }
        
        return avlTree
    }
    
}
