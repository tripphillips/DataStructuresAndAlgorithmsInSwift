//
//  AVLTree.swift
//  AVLTree
//
//  Created by Trip Phillips on 5/7/22.
//

import Foundation

import Foundation

public struct AVLTree<T: Comparable> {
    
    public private (set) var root: AVLNode<T>?
    
    public init() {}
    
    func leftRotate(_ node: AVLNode<T>) -> AVLNode<T> {
        
        let pivot = node.rightChild!
        
        node.rightChild = pivot.leftChild
        pivot.leftChild = node
        
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        
        return pivot
    }
    
    func rightRotate(_ node: AVLNode<T>) -> AVLNode<T> {
        
        let pivot = node.leftChild!
        
        node.leftChild = pivot.rightChild
        pivot.rightChild = node
        
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        
        return pivot
    }
    
    private func rightLeftRotate(_ node: AVLNode<T>) -> AVLNode<T> {
        guard let rightChild = node.rightChild else { return node }
        
        node.rightChild = rightRotate(rightChild)
        return leftRotate(node)
    }
    
    private func leftRightRotate(_ node: AVLNode<T>) -> AVLNode<T> {
        guard let leftChild = node.leftChild else { return node }
        
        node.leftChild = leftRotate(leftChild)
        return rightRotate(node)
    }
    
    private func balanced(_ node: AVLNode<T>) -> AVLNode<T> {
        switch node.balanceFactor {
        case 2: // The left child is heaver (contains more nodes) than the right child.
            if let leftChild = node.leftChild,
                leftChild.balanceFactor == -1 {
                return leftRightRotate(node)
            } else {
                return rightRotate(node)
            }
        case -2: // The right child is heaver (contains more nodes) than the left child.
            if let rightChild = node.rightChild,
               rightChild.balanceFactor == 1 {
                return rightLeftRotate(node)
            } else {
                return leftRotate(node)
            }
        default:
            return node
        }
    }
}

extension AVLTree: CustomStringConvertible {
    public var description: String {
        guard let root = root else { return "empty tree" }
        return String(describing: root)
    }
}

extension AVLNode {
    /// The minimum value tree node
    var min: AVLNode {
        leftChild?.min ?? self
    }
    
    var isLeaf: Bool {
        self.leftChild == nil && self.rightChild == nil
    }
}

extension AVLTree: AVLTreeInsertable {
    public mutating func insert(_ value: T) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: AVLNode<T>?, value: T) -> AVLNode<T> {
        guard let node = node else {
            return AVLNode(value: value)
        }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        let balancedNode = balanced(node)
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
        
        return balancedNode
    }
}

extension AVLTree: AVLTreeInspectable {
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

extension AVLTree: AVLTreeRemovable {
    public mutating func remove(_ value: T) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: AVLNode<T>?, value: T) -> AVLNode<T>? {
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
        
        let balancedNode = balanced(node)
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
        return balancedNode
    }
    
}
