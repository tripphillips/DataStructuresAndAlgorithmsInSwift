//
//  QueueLinkedList.swift
//  Queue
//
//  Created by Trip Phillips on 4/30/22.
//

import Foundation

public class QueueLinkedList<T>: Queueable {
    private var list = DoublyLinkedList<T>()
    private var counter = 0
    public init() {}
    
    public func enqueue(_ element: T) -> Bool {
        list.append(element)
        counter += 1
        return true
    }
    
    public func dequeue() -> T? {
        guard !list.isEmpty,
              let element = list.first else {
            return nil
        }
        counter -= 1
        return list.remove(element)
    }
    
    public var count: Int {
        counter
    }
    
    public var isEmpty: Bool {
        list.isEmpty
    }
    
    public var peek: T? {
        list.first?.value
    }
}

extension QueueLinkedList: CustomStringConvertible {
  public var description: String {
    String(describing: list)
  }
}
