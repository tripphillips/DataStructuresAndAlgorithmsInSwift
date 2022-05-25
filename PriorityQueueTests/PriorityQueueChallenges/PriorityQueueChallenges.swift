//
//  PriorityQueueChallenges.swift
//  PriorityQueueTests
//
//  Created by Trip Phillips on 5/23/22.
//

import Foundation
import PriorityQueue
import Queue

struct PriorityQueueChallenge_1_ArrayBasedPriorityQueue<T: Comparable>: Queueable {
    
    private var elements = [T]()
    let sort: (T, T) -> Bool
    
    init(sort: @escaping (T,T) -> Bool, elements: [T]) {
        self.sort = sort
        self.elements = elements
        self.elements.sort(by: sort)
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        for (index, otherElement) in zip(elements.indices, elements) {
            if sort(element, otherElement) {
                elements.insert(element, at: index)
                return true
            }
        }
        elements.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        isEmpty ? nil : elements.removeLast()
    }
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    var peek: T? {
        elements.first
    }
}

struct PriorityQueueChallenge_2_PrioritizeWaitlist {
    
    struct Person: Equatable {
      let name: String
      let age: Int
      let isMilitary: Bool
    }
    
    static func prioritize(_ lhs: Person, _ rhs: Person) -> Bool {
        switch (lhs.isMilitary, rhs.isMilitary) {
        case (false, false), (true, true): return lhs.age > rhs.age
        case (true, false): return true
        case (false, true): return false
        }
    }
    
}

struct PriorityQueueChallenge_3_MinimizeRechargeStops {
    
    struct ChargingStation {
        var distance: Int
        var chargeCapacity: Int
    }
    
    enum DestinationResult {
        case reachable(rechargeStops: Int)
        case unreachable
    }
    
    static func minimumRechargeStops(to target: Int, with startCharge: Int, using stations: [ChargingStation]) -> DestinationResult {
        
        guard target > startCharge else { return .reachable(rechargeStops: 0) }
        
        var pq: PriorityQueue<Int> = PriorityQueue<Int>(sort: >, elements: [startCharge])
        var currentCharge = startCharge
        var currentStation = 0
        var minimumStops = -1
        
        while !pq.isEmpty {
            guard let charge = pq.dequeue() else {
                return .unreachable
            }
            
            currentCharge += charge
            minimumStops += 1
            
            if currentCharge >= target {
                return .reachable(rechargeStops: minimumStops)
            }
            
            while currentStation < stations.count && currentCharge >= stations[currentStation].distance {
                let chargeFromNextStation = stations[currentStation].chargeCapacity
                _ = pq.enqueue(chargeFromNextStation)
                currentStation += 1
            }
        }
        
        return .unreachable
        
    }
    
}
