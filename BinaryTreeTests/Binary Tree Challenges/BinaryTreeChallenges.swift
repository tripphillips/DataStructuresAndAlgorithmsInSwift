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

class BinaryTreeChallenge_3_Traversals<T> {
    
    func inorderTraversal(_ node: BinaryTreeNode<T>) -> [T] {
        // left, root, right
        
        var stack = Stack<BinaryTreeNode<T>>()
        var result = [T]()
        var current: BinaryTreeNode? = node
        
        while current != nil || !stack.isEmpty() {
            
            while current != nil {
                stack.push(current!)
                current = current!.leftChild
            }
            
            current = stack.pop()
            
            result.append(current!.value)
            
            current = current?.rightChild
            
        }
        
        return result
    }
    
    func preorderTraversal(_ node: BinaryTreeNode<T>) -> [T] {
        // root, left, right
        
        var stack = Stack<BinaryTreeNode<T>>()
        var result = [T]()
        var current = node
        
        stack.push(current)
        
        while !stack.isEmpty() {
            current = stack.pop()!
            result.append(current.value)
            
            if current.rightChild != nil {
                stack.push(current.rightChild!)
            }
            
            if current.leftChild != nil {
                stack.push(current.leftChild!)
            }
        }
        
        return result
    }
    
    func postorderTraversal(_ node: BinaryTreeNode<T>) -> [T] {
       
        // left, right, root
        
        var stack1 = Stack<BinaryTreeNode<T>>()
        var stack2 = Stack<BinaryTreeNode<T>>()
        var result = [T]()
        var current = node
        stack1.push(current)
        
        while !stack1.isEmpty() {
            
            current = stack1.pop()!
            stack2.push(current)
            
            if current.leftChild != nil {
                stack1.push(current.leftChild!)
            }
            
            if current.rightChild != nil {
                stack1.push(current.rightChild!)
            }
        }
        
        while !stack2.isEmpty() {
            result.append(stack2.pop()!.value)
        }
        
        return result
    }
}
