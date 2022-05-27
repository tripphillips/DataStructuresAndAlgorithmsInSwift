//
//  QuickSortChallenges.swift
//  QuickSortTests
//
//  Created by Trip Phillips on 5/27/22.
//

import Foundation

extension MutableCollection where Self: BidirectionalCollection, Element: Comparable {
    mutating func quickSort() {
        quickSortLumunto(low: startIndex, high: index(before: endIndex))
    }
    
    private mutating func quickSortLumunto(low: Index, high: Index) {
        if low <= high {
            let pivotValue = self[high]
            var pivot = partition { $0 > pivotValue }
            
            if pivot == endIndex {
                pivot = index(before: pivot)
            }
            
            self[..<pivot].quickSortLumunto(low: low, high: index(before: pivot))
            self[pivot...].quickSortLumunto(low: index(after: pivot), high: high)
        }
    }
}
