//
//  QueueRingBuffer.swift
//  Queue
//
//  Created by Trip Phillips on 5/1/22.
//

import Foundation

public struct QueueRingBuffer<T>: Queueable {
    
    private var ringBuffer: RingBuffer<T>
    
    public init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }
    
    public var isEmpty: Bool {
        ringBuffer.isEmpty
    }
    
    public var peek: T? {
        ringBuffer.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        ringBuffer.write(element)
    }
    
    public mutating func dequeue() -> T? {
        ringBuffer.read()
    }
}

extension QueueRingBuffer: CustomStringConvertible {
  public var description: String {
   String(describing: ringBuffer)
  }
}
