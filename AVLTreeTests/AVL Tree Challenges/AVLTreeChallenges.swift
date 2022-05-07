//
//  AVLTreeChallenges.swift
//  AVLTreeTests
//
//  Created by Trip Phillips on 5/7/22.
//

import Foundation
import AVLTree

// Challenge 1: Number of leaves
extension AVLTree {
    var leafCount: Int {
        guard let root = root else { return 0 }
        return Int(pow(2.0, Double(root.height)))
    }
}

// Challenge 2: Number of nodes
extension AVLTree {
    var nodeCount: Int {
        guard let root = root else { return 0 }
        return Int(pow(2.0, Double(root.height + 1))) - 1
    }
}

// Challenge 3: Create protocol for a traversable binary node.

protocol TraversableBinaryNode {
    associatedtype T
    var value: T { get }
    var leftChild: Self? { get }
    var rightChild: Self? { get }
    func inorderTraversal(visit: (T) -> Void)
    func preorderTraversal(visit: (T) -> Void)
    func postorderTraversal(visit: (T) -> Void)
}

extension TraversableBinaryNode {
    func inorderTraversal(visit: (T) -> Void) {
        inorderTraversal(visit: visit)
        visit(value)
        inorderTraversal(visit: visit)
    }
    
    func preorderTraversal(visit: (T) -> Void) {
        visit(value)
        preorderTraversal(visit: visit)
        preorderTraversal(visit: visit)
    }
    
    func postorderTraversal(visit: (T) -> Void) {
        postorderTraversal(visit: visit)
        postorderTraversal(visit: visit)
        visit(value)
    }
}
