//
//  QueueArray.swift
//  Queue
//
//  Created by Trip Phillips on 4/30/22.
//

import Foundation

public struct QueueArray<T>: Queueable {
    
    private var array: [T] = []
    public init() {}
    
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
    
    public var isEmpty: Bool {
        array.isEmpty
    }
     
    public var peek: T? {
        array.first
    }
}

extension QueueArray: CustomStringConvertible {
  public var description: String {
    String(describing: array)
  }
}
