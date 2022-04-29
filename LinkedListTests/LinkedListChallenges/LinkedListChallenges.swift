//
//  LinkedListChallenges.swift
//  LinkedListTests
//
//  Created by Trip Phillips on 4/29/22.
//

import Foundation
import LinkedList
import Stack

class LinkedListChallenge_1_Reverse<T> {
    
    private var linkedList = LinkedList<T>()
    
    init(_ array: [T]) {
        for element in array {
            linkedList.append(element)
        }
    }
    
    func printInReverseIterative() -> [T] {
        
        var result = [T]()
        
        var stack = Stack<T>()
        var current = linkedList.head
        
        while current != nil {
            stack.push(current!.value)
            current = current!.next
        }
        
        while !stack.isEmpty() {
            let removed = stack.pop()!
            print(removed)
            result.append(removed)
        }
        
        return result
    }
    
    func printInReverseRecursive(result: inout [T]) {
        printInReverseRecursive(node: linkedList.head, result: &result)
    }
    
    private func printInReverseRecursive(node: LinkedListNode<T>?, result: inout [T]) {
        guard let node = node else { return }
        
        printInReverseRecursive(node: node, result: &result)
        
        print(node.value)
        result.append(node.value)
    }
}
