//
//  QueueDoubleStack.swift
//  Queue
//
//  Created by Trip Phillips on 5/1/22.
//

import Foundation

public struct QueueDoubleStack<T>: Queueable {
 
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    public init() {}
    
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
    
    public var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
}

extension QueueDoubleStack: CustomStringConvertible {
  public var description: String {
    String(describing: leftStack.reversed() + rightStack)
  }
}
