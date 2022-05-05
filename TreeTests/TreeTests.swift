//
//  TreeTests.swift
//  TreeTests
//
//  Created by Trip Phillips on 5/5/22.
//

import XCTest
@testable import Tree

class TreeTests: XCTestCase {
    
    func test_depthFirstTraversal() {
        let tree = makeSUT()
        var result = [String]()
        tree.forEachDepthFirst { node in
            result.append(node.value)
        }
        
        XCTAssertEqual(result[0], "Root")
        XCTAssertEqual(result[1], "Child 1")
        XCTAssertEqual(result[2], "Child 3")
        XCTAssertEqual(result[3], "Child 4")
        XCTAssertEqual(result[4], "Child 2")
        XCTAssertEqual(result[5], "Child 5")
        XCTAssertEqual(result[6], "Child 6")
        XCTAssertEqual(result[7], "Child 7")
    }
    
    func test_breathFirstTraversal() {
        let tree = makeSUT()
        var result = [String]()
        tree.forEachBreadthFirst { node in
            result.append(node.value)
        }
        
        XCTAssertEqual(result[0], "Root")
        XCTAssertEqual(result[1], "Child 1")
        XCTAssertEqual(result[2], "Child 2")
        XCTAssertEqual(result[3], "Child 3")
        XCTAssertEqual(result[4], "Child 4")
        XCTAssertEqual(result[5], "Child 5")
        XCTAssertEqual(result[6], "Child 6")
        XCTAssertEqual(result[7], "Child 7")
    }

    func test_searchBreadthFirst() {
        
        let tree = makeSUT()
        let result = tree.search("Child 6", breadthFirst: true)
        XCTAssertEqual(result?.value, "Child 6")
    }
    
    func test_searchDepthFirst() {
        
        let tree = makeSUT()
        let result = tree.search("Child 6", breadthFirst: false)
        XCTAssertEqual(result?.value, "Child 6")
    }
    
    func test_searchBreadthFirst2() {
        
        let tree = makeSUT()
        let result = tree.search("Child 1", breadthFirst: true)
        XCTAssertEqual(result?.value, "Child 1")
    }
    
    func test_searchDepthFirst2() {
        
        let tree = makeSUT()
        let result = tree.search("Child 1", breadthFirst: false)
        XCTAssertEqual(result?.value, "Child 1")
    }
    
    private func makeSUT() -> TreeNode<String> {
        
        let root = TreeNode("Root")
        
        let child1 = TreeNode("Child 1")
        let child2 = TreeNode("Child 2")
        let child3 = TreeNode("Child 3")
        let child4 = TreeNode("Child 4")
        let child5 = TreeNode("Child 5")
        let child6 = TreeNode("Child 6")
        let child7 = TreeNode("Child 7")
        
        root.add(child1)
        root.add(child2)
        
        child1.add(child3)
        child1.add(child4)
        
        child2.add(child5)
        child2.add(child6)
        child2.add(child7)
        
        return root
    }
    
    private func makeSUTNumbers() -> TreeNode<Int> {
        
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
