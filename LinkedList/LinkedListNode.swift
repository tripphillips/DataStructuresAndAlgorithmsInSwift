//
//  LinkedListNode.swift
//  LinkedList
//
//  Created by Trip Phillips on 4/27/22.
//

import Foundation

public class LinkedListNode<T: Comparable> {
    
    public var value: T
    public var next: LinkedListNode?
    
    public init(value: T, next: LinkedListNode? = nil) {
        self.value = value
        self.next = next
    }
}

extension LinkedListNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}
