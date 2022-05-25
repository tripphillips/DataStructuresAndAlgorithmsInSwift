//
//  MergeSort.swift
//  MergeSort
//
//  Created by Trip Phillips on 5/25/22.
//

import Foundation

public struct MergeSort {
    
    public static func mergeSort<T>(_ array: [T]) -> [T] where T: Comparable {
        
        guard array.count > 1 else { return array }
        
        let middle = array.count / 2
        let left = mergeSort(Array(array[..<middle]))
        let right = mergeSort(Array(array[middle...]))
        return merge(left, right)
    }
    
    private static func merge<T>(_ left: [T], _ right: [T]) -> [T] where T: Comparable {
        
        var leftIndex = 0
        var rightIndex = 0
        
        var result: [T] = []
        
        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            
            if leftElement < rightElement {
                result.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                result.append(rightElement)
                rightIndex += 1
            } else {
                result.append(leftElement)
                result.append(rightElement)
                leftIndex += 1
                rightIndex += 1
            }
        }
        
        if leftIndex < left.count {
            result.append(contentsOf: left[leftIndex...])
        }
        
        if rightIndex < right.count {
            result.append(contentsOf: right[rightIndex...])
        }
        
        return result
    }
}
