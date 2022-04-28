//
//  LinkedList.swift
//  LinkedList
//
//  Created by Trip Phillips on 4/27/22.
//

import Foundation

public protocol HeadTailLinkedList {
    associatedtype Value
    
    /// The first node in the linked list.
    var head: LinkedListNode<Value>? { get set }
    
    /// The last node in the linked list.
    var tail: LinkedListNode<Value>? { get set }

}

public protocol HeadTailLinkedListInspectable {
    associatedtype Value
    
    /// Returns true if the linked list is empty.
    var isEmpty: Bool { get }
    
    /// Returns the node at a given index.
    func node(at index: Int) -> LinkedListNode<Value>?
}

public protocol HeadTailLinkedListInsertable {
    associatedtype Value
    
    /// adds a value at the front of the list.
    mutating func push(_ value: Value)
    
    /// adds a value at the end of the list.
    mutating func append(_ value: Value)
    
    /// adds a value after a particular list node. Returns the
    @discardableResult
    mutating func insert(_ value: Value, after node: LinkedListNode<Value>) -> LinkedListNode<Value>
}


public protocol HeadTailLinkedListRemovable {
    
}

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
    
}

extension LinkedList: CustomDebugStringConvertible {

  public var debugDescription: String {
    guard let head = head else {
      return "Empty list"
    }
    return String(describing: head)
  }
}
