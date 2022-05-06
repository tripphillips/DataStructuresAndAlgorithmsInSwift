//
//  BinaryTreeChallenges.swift
//  BinaryTreeTests
//
//  Created by Trip Phillips on 5/5/22.
//

import Foundation
import BinaryTree
import Stack

class BinaryTreeChallenge_1_HeightOfATree<T> {
    
    func height<T>(of node: BinaryTreeNode<T>?) -> Int {
        
        guard let node = node else {
            return -1
        }
        
        return 1 + max(height(of: node.leftChild), height(of: node.rightChild))
    }
}

class BinaryTreeChallenge_2_Serialization<T> {
    
    func serialize<T>(_ node: BinaryTreeNode<T>) -> [T?] {
        var array: [T?] = []
        node.preorderTraversalWithNil { array.append($0) }
        return array
    }
    
    func deserialize<T>(_ array: [T?]) -> BinaryTreeNode<T>? {
        var reversed = Array(array.reversed())
        return deserialize(&reversed)
    }
    
    private func deserialize<T>(_ array: inout [T?]) -> BinaryTreeNode<T>? {
        guard !array.isEmpty,
              let value = array.removeLast() else {
            return nil
        }
        
        let node = BinaryTreeNode(value: value)
        node.leftChild = deserialize(&array)
        node.rightChild = deserialize(&array)
        
        return node
    }
}
