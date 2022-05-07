//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by Trip Phillips on 5/7/22.
//

import Foundation
import BinaryTree

public struct BinarySearchTree<T: Comparable> {
    
    public private (set) var root: BinaryTreeNode<T>?
    
    public init() {}
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        guard let root = root else { return "empty tree" }
        return String(describing: root)
    }
}

extension BinaryTreeNode {
    /// The minimum value tree node
    var min: BinaryTreeNode {
        leftChild?.min ?? self
    }
    
    var isLeaf: Bool {
        self.leftChild == nil && self.rightChild == nil
    }
}

extension BinarySearchTree: BinarySearchTreeInsertable {
    public mutating func insert(_ value: T) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryTreeNode<T>?, value: T) -> BinaryTreeNode<T> {
        guard let node = node else {
            return BinaryTreeNode(value: value)
        }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        return node
    }
}

extension BinarySearchTree: BinarySearchTreeInspectable {
    public func contains(_ value: T) -> Bool {
        var current = root
        
        while let node = current {
            if node.value == value {
                return true
            }
            
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        
        return false
    }
}

extension BinarySearchTree: BinarySearchTreeRemovable {
    public mutating func remove(_ value: T) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryTreeNode<T>?, value: T) -> BinaryTreeNode<T>? {
        guard let node = node else { return nil }
        
        if value == node.value {
            
            // Leaf node, just remove the node.
            if node.isLeaf {
                return nil
            }
            
            // No left child, remove the node and reconnect the right node.
            if node.leftChild == nil {
                return node.rightChild
            }
            
            // No right child, remove the node and reconnect the left node.
            if node.rightChild == nil {
                return node.leftChild
            }
            
            // Node has both a left and a right child, then replace the node value with the smallest value from the right subtree.
            // Remove the swapped value
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
            
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        
        return node
    }
    
}
