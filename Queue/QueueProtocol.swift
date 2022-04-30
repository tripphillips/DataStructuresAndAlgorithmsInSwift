//
//  QueueProtocol.swift
//  Queue
//
//  Created by Trip Phillips on 4/30/22.
//

import Foundation

public protocol Queueable {
    associatedtype T
    
    /// Inserts an element at the back of the queue.
    /// - Returns: True if the operation was successful
    mutating func enqueue(_ element: T) -> Bool
    /// Remove the element at the front of the queue
    /// - Returns: The element that was removed.
    mutating func dequeue() -> T?
    
    /// Returns true if the queue is empty.
    var isEmpty: Bool { get }
    /// Returns the element at the front of the queue without removing it.
    var peek: T? { get }
}
