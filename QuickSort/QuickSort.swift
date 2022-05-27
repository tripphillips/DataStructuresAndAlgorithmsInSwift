//
//  QuickSort.swift
//  QuickSort
//
//  Created by Trip Phillips on 5/27/22.
//

import Foundation

public struct QuickSort {
    
    public static func quickSortNaive<T: Comparable>(_ array: [T]) -> [T] {
        
        guard array.count > 1 else { return array }
        
        let pivot = array[array.count / 2]
        let less = array.filter { $0 < pivot }
        let equal = array.filter { $0 == pivot }
        let greater = array.filter { $0 > pivot }
        
        return quickSortNaive(less) + equal + quickSortNaive(greater)
    }
    
    public static func quickSortLumunto<T: Comparable>(_ array: inout [T],
                                                       low: Int,
                                                       high: Int) {
        if low < high {
            let pivot = partitionLumonto(&array, low: low, high: high)
            quickSortLumunto(&array, low: low, high: pivot - 1)
            quickSortLumunto(&array, low: pivot + 1, high: high)
        }
    }
    
    public static func partitionLumonto<T: Comparable>(_ array: inout [T],
                                                  low: Int,
                                                  high: Int) -> Int {
        
        let pivot = array[high]
        
        var i = low
        for j in low..<high {
            if array[j] <= pivot {
                array.swapAt(i, j)
                i += 1
            }
        }
        
        array.swapAt(i, high)
        return i
    }
    
    public static func quickSortHoare<T: Comparable>(_ array: inout [T],
                                                     low: Int,
                                                     high: Int) {
        if low < high {
            let pivot = partitionHoare(&array, low: low, high: high)
            quickSortHoare(&array, low: low, high: pivot)
            quickSortHoare(&array, low: pivot + 1, high: high)
        }
    }
    
    public static func partitionHoare<T: Comparable>(_ array: inout [T],
                                                     low: Int,
                                                     high: Int) -> Int {
        let pivot = array[low]
        var i = low - 1
        var j = high + 1
        
        while true {
            repeat { j -= 1 } while array[j] > pivot
            repeat { i += 1 } while array[i] < pivot
            
            if i < j {
                array.swapAt(i, j)
            } else {
                return j
            }
        }
    }
    
    public static func quickSortMedian<T: Comparable>(_ array: inout [T],
                                               low: Int,
                                               high: Int) {
        if low < high {
            let pivotIndex = medianOfThree(&array, low: low, high: high)
            array.swapAt(pivotIndex, high)
            let pivot = partitionLumonto(&array, low: low, high: high)
            quickSortLumunto(&array, low: low, high: pivot - 1)
            quickSortLumunto(&array, low: pivot + 1, high: high)
        }
    }
    
    public static func medianOfThree<T: Comparable>(_ array: inout [T],
                                             low: Int,
                                             high: Int) -> Int {
        let center = (low + high) / 2
        if array[low] > array[center] {
            array.swapAt(low, center)
        }
        if array[low] > array[high] {
            array.swapAt(low, high)
        }
        if array[center] > array[high] {
            array.swapAt(center, high)
        }
        return center
    }
    
    public static func partitionDutchFlag<T: Comparable>(_ array: inout [T],
                                                         low: Int,
                                                         high: Int,
                                                         pivotIndex: Int) -> (Int, Int) {
        let pivot = array[pivotIndex]
        var smaller = low
        var equal = low
        var larger = high
        
        while equal <= larger {
            if array[equal] < pivot {
                array.swapAt(smaller, equal)
                smaller += 1
                equal += 1
            } else if array[equal] == pivot {
                equal += 1
            } else {
                array.swapAt(equal, larger)
                larger -= 1
            }
        }
        return (smaller, larger)
    }
    
    public static func quickSortDutchFlag<T: Comparable>(_ array: inout [T],
                                                         low: Int,
                                                         high: Int) {
        if low < high {
            let (middleFirst, middleLast) = partitionDutchFlag(&array,
                                                               low: low,
                                                               high: high,
                                                               pivotIndex: high)
            quickSortDutchFlag(&array, low: low, high: middleFirst - 1)
            quickSortDutchFlag(&array, low: middleLast + 1, high: high)
        }
    }

}
