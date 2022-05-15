//
//  HeapChallenges.swift
//  HeapTests
//
//  Created by Trip Phillips on 5/14/22.
//

import Foundation
import Heap

class HeapChallenges_1_NthSmallestInteger {
    
    func nthSmallestIn(_ array: [Int], n: Int) -> Int? {
        
        var heap = Heap<Int>(sort: <, elements: array)
        
        var current = 1

        while !heap.isEmpty {
            let removed = heap.remove()
            if current == n {
                return removed
            }
            current += 1
        }
        
        return nil
    }
    
}

class HeapChallenges_4_IsMinHeap {
    
    func isMinHeap<T: Comparable>(elements: [T]) -> Bool {
        guard !elements.isEmpty else {
            return true
        }
        
        for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
            let left = leftChildIndex(ofParentAt: i)
            let right = rightChildIndex(ofParentAt: i)
            if elements[left] < elements[i] {
                return false
            }
            if right < elements.count && elements[right] < elements[i]  {
                return false
            }
        }
        return true
    }
    
    private func leftChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 1
    }
    
    private func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }
}
