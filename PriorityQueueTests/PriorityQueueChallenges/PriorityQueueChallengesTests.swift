//
//  PriorityQueueChallengesTests.swift
//  PriorityQueueTests
//
//  Created by Trip Phillips on 5/23/22.
//

import XCTest
import PriorityQueue

class PriorityQueueChallengesTests: XCTestCase {

    func test_enqueue_ArrayBasedPriorityQueueChallenge1() {
        var sut = PriorityQueueChallenge_1_ArrayBasedPriorityQueue(sort: <, elements: [2,4,22,3,11,5])
        
        XCTAssertTrue(sut.enqueue(10))
        XCTAssertEqual(sut.peek, 2)
    }
    
    func test_dequeue_ArrayBasedPriorityQueueChallenge1() {
        var sut = PriorityQueueChallenge_1_ArrayBasedPriorityQueue(sort: <, elements: [2,4,22,3,11,5])
        
        XCTAssertTrue(sut.enqueue(10))
        XCTAssertEqual(sut.dequeue(), 22)
    }
    
    func test_isEmpty_ArrayBasedPriorityQueueChallenge1() {
        let sut = PriorityQueueChallenge_1_ArrayBasedPriorityQueue(sort: <, elements: [1,2])
        XCTAssertFalse(sut.isEmpty)
    }

    func test_sort_PrioritizeWaitlistChallenge2() {
        
        let waitlist = [
            PriorityQueueChallenge_2_PrioritizeWaitlist.Person(name: "Any", age: 18, isMilitary: true),
            PriorityQueueChallenge_2_PrioritizeWaitlist.Person(name: "Any", age: 50, isMilitary: true),
            PriorityQueueChallenge_2_PrioritizeWaitlist.Person(name: "Any", age: 58, isMilitary: true),
            PriorityQueueChallenge_2_PrioritizeWaitlist.Person(name: "Any", age: 78, isMilitary: true),
            PriorityQueueChallenge_2_PrioritizeWaitlist.Person(name: "Any", age: 17, isMilitary: false),
            PriorityQueueChallenge_2_PrioritizeWaitlist.Person(name: "Any", age: 18, isMilitary: false),
        ]
        
        var pq = PriorityQueue<PriorityQueueChallenge_2_PrioritizeWaitlist.Person>(sort: PriorityQueueChallenge_2_PrioritizeWaitlist.prioritize(_:_:), elements: waitlist)
        
        XCTAssertEqual(pq.peek?.age, 78)
        XCTAssertEqual(pq.dequeue()?.age, 78)
        XCTAssertEqual(pq.peek?.age, 58)
        XCTAssertTrue(pq.enqueue(PriorityQueueChallenge_2_PrioritizeWaitlist.Person(name: "Any", age: 100, isMilitary: false)))
        XCTAssertEqual(pq.peek?.age, 58)
    }
    
    func test_minimumRecharge_Challenge3() {
        let stations = [
            PriorityQueueChallenge_3_MinimizeRechargeStops.ChargingStation(distance: 10, chargeCapacity: 60),
            PriorityQueueChallenge_3_MinimizeRechargeStops.ChargingStation(distance: 20, chargeCapacity: 30),
            PriorityQueueChallenge_3_MinimizeRechargeStops.ChargingStation(distance: 30, chargeCapacity: 30),
            PriorityQueueChallenge_3_MinimizeRechargeStops.ChargingStation(distance: 60, chargeCapacity: 40)
        ]
        let sut = PriorityQueueChallenge_3_MinimizeRechargeStops.minimumRechargeStops(to: 100, with: 10, using: stations)
        
        var result = 0
        switch sut {
        case .reachable(rechargeStops: let stops): result = stops
        case .unreachable: break
        }
        
        XCTAssertEqual(result, 2)
    }
}
