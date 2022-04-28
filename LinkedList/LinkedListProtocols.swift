//
//  LinkedListProtocols.swift
//  LinkedList
//
//  Created by Trip Phillips on 4/28/22.
//

import Foundation

public protocol HeadTailLinkedList {
    associatedtype T
    
    /// The first node in the linked list.
    var head: LinkedListNode<T>? { get set }
    
    /// The last node in the linked list.
    var tail: LinkedListNode<T>? { get set }
}

public protocol HeadTailLinkedListInspectable {
    associatedtype T
    
    /// Returns true if the linked list is empty.
    var isEmpty: Bool { get }
    
    /// Finds the node at an index and returns it.
    /// - Parameters:
    ///     - index: The index of the node beginning from 0.
    /// - Returns: the node at a given index.
    func node(at index: Int) -> LinkedListNode<T>?
}

public protocol HeadTailLinkedListInsertable {
    associatedtype T
    
    /// adds a value at the front of the list.
    mutating func push(_ value: T)
    
    /// adds a value at the end of the list.
    mutating func append(_ value: T)
    
    /// adds a value after a particular list node.
    /// - Parameters:
    ///     - value: The value to insert as a node.
    ///     - after node: the node to insert the new node after.
    /// - Returns: The node added
    @discardableResult
    mutating func insert(_ value: T, after node: LinkedListNode<T>) -> LinkedListNode<T>
}

public protocol HeadTailLinkedListRemovable {
    associatedtype T
    
    /// Removes the value at the front of the list.
    /// - Returns: The value that was removed.
    mutating func pop() -> T?
    
    /// Removes the value at the end of the list.
    /// - Returns: The value that was removed.
    @discardableResult
    mutating func removeLast() -> T?
    
    /// Removes a value anywhere in the list.
    /// - Parameters:
    ///     - after node: the node that should have its next node removed.
    /// - Returns: The value that was removed.
    mutating func remove(after node: LinkedListNode<T>) -> T?
}
