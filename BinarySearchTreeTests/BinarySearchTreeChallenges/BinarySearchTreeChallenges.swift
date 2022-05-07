//
//  BinarySearchTreeChallenges.swift
//  BinarySearchTreeTests
//
//  Created by Trip Phillips on 5/7/22.
//

import Foundation
import BinaryTree
import BinarySearchTree

// Challenge 1: Implement method to determine if a BinaryTreeNode is a Binary Search Tree
extension BinaryTreeNode where T: Comparable {
    var isBinarySeachTree: Bool {
        isBST(self, min: nil, max: nil)
    }
    
    private func isBST(_ tree: BinaryTreeNode<T>?,
                       min: T?,
                       max: T?) -> Bool {
        guard let tree = tree else {
            return true
        }
        
        if let min = min,
           tree.value <= min {
            return false
        } else if let max = max,
                  tree.value > max {
            return false
        }

        return isBST(tree.leftChild, min: min, max: tree.value) && isBST(tree.rightChild, min: tree.value, max: max)
    }
}

// Challenge 2: Conform to Equatable
extension BinarySearchTree: Equatable {
    public static func == (lhs: BinarySearchTree<T>, rhs: BinarySearchTree<T>) -> Bool {
        return isEqual(lhs.root, rhs.root)
    }
    
    private static func isEqual<T: Equatable>(_ lhsNode: BinaryTreeNode<T>?, _ rhsNode: BinaryTreeNode<T>?) -> Bool {
        
        guard let leftNode = lhsNode,
              let rightNode = rhsNode else {
            return lhsNode == nil && rhsNode == nil
        }
        
        return leftNode.value == rightNode.value &&
        isEqual(leftNode.leftChild, rightNode.leftChild) &&
        isEqual(leftNode.rightChild, rightNode.rightChild)
    }
}

// Challenge 3: Is it a subtree?
extension BinarySearchTree where T: Hashable {
    
    public func contains(_ subtree: BinarySearchTree) -> Bool {
        var set: Set<T> = []
        root?.inorderTraversal {
            set.insert($0)
        }
        
        var isEqual = true
        
        subtree.root?.inorderTraversal {
            isEqual = isEqual && set.contains($0)
        }
        
        return isEqual
    }
    
}
