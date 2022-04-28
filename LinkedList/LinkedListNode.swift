//
//  LinkedListNode.swift
//  LinkedList
//
//  Created by Trip Phillips on 4/27/22.
//

import Foundation

public class LinkedListNode<Value> {
    
    public var value: Value
    public var next: LinkedListNode?
    
    public init(value: Value, next: LinkedListNode?) {
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
