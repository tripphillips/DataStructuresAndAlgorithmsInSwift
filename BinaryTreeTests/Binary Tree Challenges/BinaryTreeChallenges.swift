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
