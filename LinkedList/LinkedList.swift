//
//  LinkedList.swift
//  LinkedList
//
//  Created by Trip Phillips on 4/27/22.
//

import Foundation

// MARK: - HeadTailLinkedList
public struct LinkedList<T>: HeadTailLinkedList {
    
    public var head: LinkedListNode<T>?
    public var tail: LinkedListNode<T>?
    
    public init() {}
}

// MARK: - HeadTailLinkedListInspectable
extension LinkedList: HeadTailLinkedListInspectable {
    
    public var isEmpty: Bool {
    
    }
    
    public func node(at index: Int) -> LinkedListNode<T>? {
        
    }
}

// MARK: - HeadTailLinkedListInsertable
extension LinkedList: HeadTailLinkedListInsertable {
    
    public mutating func push(_ T: T) {
        
    }
    
    public mutating func append(_ T: T) {
       
    }
    
    @discardableResult
    public mutating func insert(_ T: T,
                                after node: LinkedListNode<T>) -> LinkedListNode<T> {
        
    }
}

// MARK: - HeadTailLinkedListRemovable
extension LinkedList: HeadTailLinkedListRemovable {
    public mutating func pop() -> T? {
        
    }
    
    @discardableResult
    public mutating func removeLast() -> T? {
       
    }
    
    public mutating func remove(after node: LinkedListNode<T>) -> T? {
        
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
