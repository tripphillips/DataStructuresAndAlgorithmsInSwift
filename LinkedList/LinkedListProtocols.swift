//
//  LinkedListProtocols.swift
//  LinkedList
//
//  Created by Trip Phillips on 4/28/22.
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
    associatedtype Value
    
    /// Removes the value at the front of the list.
    mutating func pop() -> Value?
    
    /// Removes the value at the end of the list.
    @discardableResult
    mutating func removeLast() -> Value?
    
    /// Removes a value anywhere in the list.
    mutating func remove(after node: LinkedListNode<Value>) -> Value?
}
