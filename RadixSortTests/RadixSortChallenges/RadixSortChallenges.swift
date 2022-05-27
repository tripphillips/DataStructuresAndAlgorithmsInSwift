//
//  RadixSortChallenges.swift
//  RadixSortTests
//
//  Created by Trip Phillips on 5/26/22.
//

import Foundation

extension Array where Element == Int {
    
    public mutating func lexicographicalSort() {
      self = msdRadixSort(self, 0)
    }
    
    private func msdRadixSort(_ array: [Int], _ position: Int) -> [Int] {
        
        guard position < array.maxDigits else { return array }
        
        let base = 10
        
        var buckets: [[Int]] = .init(repeating: [], count: base)
        var priorityBucket: [Int] = []
   
        array.forEach { number in
            guard let digit = number.digit(atPosition: position) else {
                priorityBucket.append(number)
                return
            }
            buckets[digit].append(number)
        }
        
        priorityBucket.append(contentsOf: buckets.reduce(into: []) { result, bucket in
            guard !bucket.isEmpty else { return }
            result.append(contentsOf: msdRadixSort(bucket, position + 1))
        })
        
        return priorityBucket
    }
    
    private var maxDigits: Int {
        self.max()?.digits ?? 0
    }
}

extension Int {
    
    var digits: Int {
        var count = 0
        var num = self
        while num != 0 {
            count += 1
            num /= 10
        }
        return count
    }
    
    func digit(atPosition position: Int) -> Int? {
        guard position < digits else {
            return nil
        }
        
        var num = self
        let correctedPosition = Double(position + 1)
        
        while num / Int(pow(10.0, correctedPosition)) != 0 {
            num /= 10
        }
        
        return num % 10
    }
    
}
