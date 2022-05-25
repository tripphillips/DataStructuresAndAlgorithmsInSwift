//
//  BigONSquaredSortsChallenges.swift
//  BigONSquaredSortsTests
//
//  Created by Trip Phillips on 5/24/22.
//

import Foundation

struct BigONSquaredSortsChallenges {
    
    // MARK: - Challenge 1 Group Elements
    static func rightAlign<T>(_ value: T.Element, in collection: inout T) where T: MutableCollection & BidirectionalCollection, T.Element: Equatable {
        
        var left = collection.startIndex
        var right = collection.index(before: collection.endIndex)
        
        while left < right {
            
            while collection[right] == value {
                collection.formIndex(before: &right)
            }
            
            while collection[left] != value {
                collection.formIndex(after: &left)
            }
            
            guard left < right else {
                return
            }
            
            collection.swapAt(left, right)
            
        }
        
    }
    
    // MARK: - Challenge 2 Find a Duplicate
    static func findFirstDuplicate<T>(in collection: T) -> T.Element? where T: MutableCollection, T.Element: Equatable & Hashable {
        
        var set = Set<T.Element>()
        
        for value in collection {
            if !set.insert(value).inserted {
                return value
            }
        }
        
        return nil
    }
    
    // MARK: - Challenge 3 Reverse a collection
    static func reverse<T>(_ collection: inout T) where T: MutableCollection & BidirectionalCollection {
        
        var left = collection.startIndex
        var right = collection.index(before: collection.endIndex)
        
        while left < right {
            collection.swapAt(left, right)
            collection.formIndex(after: &left)
            collection.formIndex(before: &right)
        }
        
    }
    
}
