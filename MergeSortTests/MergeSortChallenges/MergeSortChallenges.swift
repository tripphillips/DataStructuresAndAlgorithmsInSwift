//
//  MergeSortChallenges.swift
//  MergeSortTests
//
//  Created by Trip Phillips on 5/25/22.
//

import Foundation
import MergeSort

struct MergeSortChallenges {
    
    // MARK: Speed Up Appends - Challenge 1
    static func speedUpAppends() {
        
        let size = 1024
        var values: [Int] = []
        values.reserveCapacity(size)
        
        for i in 0..<size {
            values.append(i)
        }
        
    }
    
    // MARK: Merge Two Sequences - Challenge 2
    static func merge<T: Sequence>(first: T, second: T) -> AnySequence<T.Element> where T.Element: Comparable {
        
        var result: [T.Element] = []
        
        var firstIterator = first.makeIterator()
        var secondIterator = second.makeIterator()
        
        var firstNextValue = firstIterator.next()
        var secondNextValue = secondIterator.next()
        
        while let first = firstNextValue,
              let second = secondNextValue {
            if first < second {
                result.append(first)
                firstNextValue = firstIterator.next()
            } else if first > second {
                result.append(second)
                secondNextValue = secondIterator.next()
            } else {
                result.append(first)
                result.append(second)
                firstNextValue = firstIterator.next()
                secondNextValue = secondIterator.next()
            }
        }
        
        while let first = firstNextValue {
            result.append(first)
            firstNextValue = firstIterator.next()
        }
        
        while let second = secondNextValue {
            result.append(second)
            secondNextValue = secondIterator.next()
        }
        
        return AnySequence<T.Element>(result)
    }
}
