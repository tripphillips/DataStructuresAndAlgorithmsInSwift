//
//  LinkedListChallenges.swift
//  LinkedListTests
//
//  Created by Trip Phillips on 4/29/22.
//

import Foundation
import LinkedList
import Stack

class LinkedListChallenge<T: Comparable> {
    var linkedList = LinkedList<T>()
    
    init(_ array: [T]) {
        for element in array {
            linkedList.append(element)
        }
    }
}

class LinkedListChallenge_1_Reverse<T: Comparable>: LinkedListChallenge<T> {
    
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
    
    func printInReverseRecursive(node: LinkedListNode<T>?, result: inout [T]) {
        guard let node = node else { return }
        
        printInReverseRecursive(node: node.next, result: &result)
        
        print(node.value)
        result.append(node.value)
    }
}

class LinkedListChallenge_2_MiddleNode<T: Comparable>: LinkedListChallenge<T> {
    
    func findMiddleNode() -> LinkedListNode<T>? {
        
        var slow = linkedList.head
        var fast = linkedList.head
        
        while let nextFast = fast?.next {
            fast = nextFast.next
            slow = slow?.next
        }
        
        return slow
    }
}

class LinkedListChallenge_3_ReverseLinkedList<T: Comparable>: LinkedListChallenge<T> {
    
    func reverseLinkedList() -> LinkedList<T>? {
        
        var linkedList = linkedList
        
        var previous = linkedList.head
        var current = linkedList.head?.next
        previous?.next = nil
        
        while current != nil {
            let next = current?.next
            current?.next = previous
            previous = current
            current = next
        }
        
        linkedList.head = linkedList.tail
        
        return linkedList
    }
}

class LinkedListChallenge_4_MergeLinkedLists<T: Comparable>  {
    
    var left: LinkedList<T>
    var right: LinkedList<T>
    
    init(leftArray: [T], rightArray: [T]) {
        left = LinkedList<T>()
        right = LinkedList<T>()
        
        fill(&left, with: leftArray)
        fill(&right, with: rightArray)
    }
    
    private func fill(_ linkedList: inout LinkedList<T>, with array: [T]) {
        for element in array {
            linkedList.append(element)
        }
    }
    
    func merge() -> LinkedList<T>? {
        
        // Set up check for left and right linked list then set head and tail
        
        guard !left.isEmpty else {
            return right
        }
        
        guard !right.isEmpty else {
            return left
        }
        
        var newHead: LinkedListNode<T>?
        var tail: LinkedListNode<T>?
        
        var currentLeft = left.head
        var currentRight = right.head
        
        if let leftHead = currentLeft,
           let rightHead = currentRight {
            if leftHead.value > rightHead.value {
                newHead = rightHead
                currentRight = rightHead.next
            } else {
                newHead = leftHead
                currentLeft = leftHead.next
            }
            
            tail = newHead
        }
        
        // Iterate through both left and right
        
        while let nextLeft = currentLeft,
              let nextRight = currentRight {
            
            if nextLeft.value > nextRight.value {
                tail?.next = nextRight
                currentRight = currentRight?.next
            } else {
                tail?.next = nextLeft
                currentLeft = currentLeft?.next
            }
            
            tail = tail?.next
        }
        
        
        // Handle remaining nodes
        if let currentLeft = currentLeft {
            tail?.next = currentLeft
        }
        
        if let currentRight = currentRight {
            tail?.next = currentRight
        }
        
        // Create new merged list
        var linkedList = LinkedList<T>()
        linkedList.head = newHead
        linkedList.tail = {
            while let next = tail?.next {
                tail = next
            }
            return tail
        }()
        
        return linkedList
    }
}

class LinkedListChallenge_5_RemoveAllOccurences<T: Comparable>: LinkedListChallenge<T> {
    
    func removeAll(_ value: T) {
        
        while let head = linkedList.head,
              head.value == value {
            linkedList.head = linkedList.head?.next
        }
        
        var previous = linkedList.head
        var current = linkedList.head?.next
        
        while let currentNode = current {
            guard currentNode.value != value else {
                previous?.next = currentNode.next
                current = previous?.next
                continue
            }
            
            previous = current
            current = current?.next
        }
        
        linkedList.tail = previous
        
    }
}
