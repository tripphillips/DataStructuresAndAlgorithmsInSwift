//
//  TreeNode.swift
//  Tree
//
//  Created by Trip Phillips on 5/5/22.
//

import Foundation
import Queue
import Stack

public class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

// Tree Traversals
extension TreeNode {
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        var stack = Stack<TreeNode>()
        children.reversed().forEach { stack.push($0) }
        while let node = stack.pop() {
            visit(node)
            node.children.reversed().forEach { stack.push($0) }
        }
    }
    
    public func forEachBreadthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        let queue = QueueLinkedList<TreeNode>()
        children.forEach { _ = queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { _ = queue.enqueue($0) }
        }
    }
}

extension TreeNode where T: Equatable {
    public func search(_ value: T, breadthFirst: Bool) -> TreeNode? {
        
        var result: TreeNode?
        
        if breadthFirst {
            forEachBreadthFirst { node in
                if node.value == value {
                    result = node
                }
            }
        } else {
            forEachDepthFirst { node in
                if node.value == value {
                    result = node
                }
            }
            
        }
        return result
    }
}
