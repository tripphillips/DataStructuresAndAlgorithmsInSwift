//
//  LinkedList.swift
//  LinkedList
//
//  Created by Trip Phillips on 4/27/22.
//

import Foundation

// MARK: - HeadTailLinkedList
public struct LinkedList<Value>: HeadTailLinkedList {
    
    public var head: LinkedListNode<Value>?
    public var tail: LinkedListNode<Value>?
    
    public init() {}
}

// MARK: - HeadTailLinkedListInspectable
extension LinkedList: HeadTailLinkedListInspectable {
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public func node(at index: Int) -> LinkedListNode<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
}

// MARK: - HeadTailLinkedListInsertable
extension LinkedList: HeadTailLinkedListInsertable {
    
    public mutating func push(_ value: Value) {
        head = LinkedListNode(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail!.next = LinkedListNode(value: value, next: nil)
        tail = tail!.next
    }
    
    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: LinkedListNode<Value>) -> LinkedListNode<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = LinkedListNode(value: value, next: node.next)
        return node.next!
    }
}

// MARK: - HeadTailLinkedListRemovable
extension LinkedList: HeadTailLinkedListRemovable {
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var previous = head
        var current = head
        
        while let next = current.next {
            previous = current
            current = next
        }
        
        previous.next = nil
        tail = previous
        return current.value
    }
    
    public mutating func remove(after node: LinkedListNode<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            
            node.next = node.next?.next
        }
        return node.next?.value
    }
}

extension LinkedList: CustomDebugStringConvertible {

  public var debugDescription: String {
    guard let head = head else {
      return "Empty list"
    }
    return String(describing: head)
  }
}
