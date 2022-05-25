//
//  BigONSquaredSorts.swift
//  BigONSquaredSorts
//
//  Created by Trip Phillips on 5/23/22.
//

import Foundation

public struct BigONSquaredSorts {
    
    public static func bubbleSort<T>(_ collection: inout T) where T: MutableCollection, T.Element: Comparable {
        
        guard collection.count > 1 else { return }
        
        for end in collection.indices.reversed() {
            
            var swapped = false
            var current = collection.startIndex
            
            while current < end {
                let next = collection.index(after: current)
                if collection[current] > collection[next] {
                    collection.swapAt(current, next)
                    swapped = true
                }
                current = next
            }
            
            if !swapped {
                return
            }
        }
    }
    
    public static func selectionSort<T>(_ collection: inout T) where T: MutableCollection, T.Element: Comparable {
        
        guard collection.count > 1 else { return }
        
        for current in collection.indices {
            
            var lowest = current
            var other = collection.index(after: current)
            
            while other < collection.endIndex {
                if collection[lowest] > collection[other] {
                    lowest = other
                }
                other = collection.index(after: other)
            }
            
            if lowest != current {
                collection.swapAt(lowest, current)
            }
        }
    }
    
    public static func insertionSort<T>(_ collection: inout T) where T: BidirectionalCollection & MutableCollection, T.Element: Comparable {
        
        guard collection.count > 1 else { return }
        
        for current in collection.indices {
            
            var shifting = current
            
            while shifting > collection.startIndex {
                
                let previous = collection.index(before: shifting)
                
                if collection[shifting] < collection[previous] {
                    collection.swapAt(shifting, previous)
                } else {
                    break
                }
                
                shifting = previous
            }
        }
    }
}
