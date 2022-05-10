//
//  BinarySearch.swift
//  BinarySearch
//
//  Created by Trip Phillips on 5/10/22.
//

import Foundation


public func binarySearch<Elements: RandomAccessCollection>(for element: Elements.Element,
                                                           in collection: Elements,
                                                           in range: Range<Elements.Index>? = nil) -> Elements.Index? where Elements.Element: Comparable {
    let range = range ?? collection.startIndex..<collection.endIndex
    
    guard range.lowerBound < range.upperBound else {
        return nil
    }
    
    let size = collection.distance(from: range.lowerBound, to: range.upperBound)
    let middle = collection.index(range.lowerBound, offsetBy: size / 2)
    
    if collection[middle] == element {
        return middle
    } else if collection[middle] > element {
        return binarySearch(for: element, in: collection, in: range.lowerBound..<middle)
    } else {
        return binarySearch(for: element, in: collection, in: collection.index(after: middle)..<range.upperBound)
    }
}

public func findIndices(of value: Int,
                        in array: [Int]) -> CountableRange<Int>? {
    guard let startIndex = startIndex(of: value,
                                      in: array,
                                      range: 0..<array.count) else {
        return nil
    }
    guard let endIndex = endIndex(of: value,
                                  in: array,
                                  range: 0..<array.count) else {
        return nil
    }
    return startIndex..<endIndex
}

public func startIndex(of value: Int,
                       in array: [Int],
                       range: CountableRange<Int>) -> Int? {
    // 1
    let middleIndex = range.lowerBound +
    (range.upperBound - range.lowerBound) / 2
    
    // 2
    if middleIndex == 0 || middleIndex == array.count - 1 {
        if array[middleIndex] == value {
            return middleIndex
        } else {
            return nil
        }
    }
    
    // 3
    if array[middleIndex] == value {
        if array[middleIndex - 1] != value {
            return middleIndex
        } else {
            return startIndex(of: value,
                              in: array,
                              range: range.lowerBound..<middleIndex)
        }
    } else if value < array[middleIndex]  {
        return startIndex(of: value,
                          in: array,
                          range: range.lowerBound..<middleIndex)
    } else {
        return startIndex(of: value,
                          in: array,
                          range: middleIndex..<range.upperBound)
    }
}

public func endIndex(of value: Int,
                     in array: [Int],
                     range: CountableRange<Int>) -> Int? {
    let middleIndex = range.lowerBound +
    (range.upperBound - range.lowerBound) / 2
    
    if middleIndex == 0 || middleIndex == array.count - 1 {
        if array[middleIndex] == value {
            return middleIndex + 1
        } else {
            return nil
        }
    }
    
    if array[middleIndex] == value {
        if array[middleIndex + 1] != value {
            return middleIndex + 1
        } else {
            return endIndex(of: value,
                            in: array,
                            range: middleIndex..<range.upperBound)
        }
    } else if value < array[middleIndex]  {
        return endIndex(of: value,
                        in: array,
                        range: range.lowerBound..<middleIndex)
    } else {
        return endIndex(of: value,
                        in: array,
                        range: middleIndex..<range.upperBound)
    }
    
}
