//
//  PriorityQueue.swift
//  PriorityQueue
//
//  Created by Trip Phillips on 5/15/22.
//

import Foundation
import Queue
import Heap

struct PriorityQueue<T: Equatable>: Queueable {
    
    private var heap: Heap<T>
    
    init(sort: @escaping (T,T) -> Bool, elements: [T] = []) {
        heap = Heap(sort: sort, elements: elements)
    }
    
    var isEmpty: Bool {
        heap.isEmpty
    }
    
    var peek: T? {
        heap.peek()
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        heap.insert(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        heap.remove()
    }
    
}
