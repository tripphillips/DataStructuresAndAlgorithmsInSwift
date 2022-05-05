//
//  TreeChallenges.swift
//  TreeTests
//
//  Created by Trip Phillips on 5/5/22.
//

import Foundation
import Tree
import Queue

class TreeChallenge_1_PrintEachLevel {
    
    public func printEachLevel<T>(for tree: TreeNode<T>) -> [[T]]{
        let queue = QueueLinkedList<TreeNode<T>>()
        var nodesLeftInCurrentLevel = 0
        _ = queue.enqueue(tree)
        
        var allLevelValues = [[T]]()
        
        while !queue.isEmpty {
            nodesLeftInCurrentLevel = queue.count
            var levelValues = [T]()
            
            while nodesLeftInCurrentLevel > 0 {
                guard let node = queue.dequeue() else { break }
                print("\(node.value) ", terminator: "")
                levelValues.append(node.value)
                node.children.forEach { _ = queue.enqueue($0) }
                nodesLeftInCurrentLevel -= 1
            }
            allLevelValues.append(levelValues)
            print()
        }
    
        return allLevelValues
    }
    
}
