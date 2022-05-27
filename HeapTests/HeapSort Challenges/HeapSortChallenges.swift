//
//  HeapSortChallenges.swift
//  HeapTests
//
//  Created by Trip Phillips on 5/26/22.
//

import Foundation

extension Array where Element: Comparable {
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }
    
    mutating func siftDown(from index: Int, upTo size: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            
            var candidate = parent
            
            if left < size && self[left] > self[candidate] {
               candidate = left
            }
            
            if right < size && self[right] > self[candidate] {
                candidate = right
            }
            
            if candidate == parent {
                return
            }
            
            swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    mutating func heapSort() {
        if !isEmpty {
            for i in stride(from: count / 2 - 1, to: 0, by: -1) {
                siftDown(from: i, upTo: count)
            }
        }
        
        for index in indices.reversed() {
            swapAt(0, index)
            siftDown(from: 0, upTo: index)
        }
    }
}
