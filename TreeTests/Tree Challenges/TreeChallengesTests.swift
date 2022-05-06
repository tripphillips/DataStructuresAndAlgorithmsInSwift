//
//  TreeChallengesTests.swift
//  TreeTests
//
//  Created by Trip Phillips on 5/5/22.
//

import XCTest
import Tree

class TreeChallengesTests: XCTestCase {

    func test_printEachLevel() {
        let sut = TreeChallenge_1_PrintEachLevel()
        let tree: TreeNode<Int> = makeNumberTree()
        let result = sut.printEachLevel(for: tree)
        XCTAssertEqual(result, [[0],[10,11],[20,21,31,32],[33]])
    }

    
    private func makeNumberTree() -> TreeNode<Int> {
        let root = TreeNode(0)
        
        let child1 = TreeNode(10)
        let child2 = TreeNode(11)
        let child3 = TreeNode(20)
        let child4 = TreeNode(21)
        let child5 = TreeNode(31)
        let child6 = TreeNode(32)
        let child7 = TreeNode(33)
        
        root.add(child1)
        root.add(child2)
        
        child1.add(child3)
        child1.add(child4)
        
        child2.add(child5)
        child2.add(child6)
        
        child6.add(child7)
        
        return root
    }
}
