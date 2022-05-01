//
//  DoublyLinkedList.swift
//  Queue
//
//  Created by Trip Phillips on 4/30/22.
//

import Foundation

public class DoublyLinkedList<T> {
    
    private var head: DoublyLinkedListNode<T>?
    private var tail: DoublyLinkedListNode<T>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public var first: DoublyLinkedListNode<T>? {
        head
    }
    
    public func append(_ value: T) {
        
        let newNode = DoublyLinkedListNode(value: value)
        
        guard let tailNode = tail else {
            head = newNode
            tail = newNode
            return
        }
        
        newNode.previous = tailNode
        tailNode.next = newNode
        tail = newNode
    }
    
    public func remove(_ node: DoublyLinkedListNode<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
}

extension DoublyLinkedList: CustomStringConvertible {
  
  public var description: String {
    var string = ""
    var current = head
    while let node = current {
      string.append("\(node.value) -> ")
      current = node.next
    }
    return string + "end"
  }
}

public class DoublyLinkedListIterator<T>: IteratorProtocol {
    private var currentNode: DoublyLinkedListNode<T>?
    
    init(node: DoublyLinkedListNode<T>?) {
        currentNode = node
    }
    
    public func next() -> DoublyLinkedListNode<T>? {
        defer { currentNode = currentNode?.next }
        return currentNode
    }
}

extension DoublyLinkedList: Sequence {
    public func makeIterator() -> DoublyLinkedListIterator<T> {
        DoublyLinkedListIterator(node: head)
    }
}
