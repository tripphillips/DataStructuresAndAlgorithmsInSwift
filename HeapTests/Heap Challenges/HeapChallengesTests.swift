//
//  HeapChallengesTests.swift
//  HeapTests
//
//  Created by Trip Phillips on 5/14/22.
//

import XCTest

class HeapChallengesTests: XCTestCase {

    func test_nthSmallest_2nd() {
        let sut = HeapChallenges_1_NthSmallestInteger()
        XCTAssertEqual(sut.nthSmallestIn([12,3,4,1,2,10,5,9], n: 2), 2)
    }
    
    func test_nthSmallest_1st() {
        let sut = HeapChallenges_1_NthSmallestInteger()
        XCTAssertEqual(sut.nthSmallestIn([12,3,4,1,2,10,5,9], n: 1), 1)
    }
    
    func test_nthSmallest_8th() {
        let sut = HeapChallenges_1_NthSmallestInteger()
        XCTAssertEqual(sut.nthSmallestIn([12,3,4,1,2,10,5,9], n: 8), 12)
    }
    
    func test_isMinHeap_MaxHeap() {
        let sut = HeapChallenges_4_IsMinHeap()
        XCTAssertFalse(sut.isMinHeap(elements: [10,5,8,3]))
    }
    
    func test_isMinHeap_MinHeap() {
        let sut = HeapChallenges_4_IsMinHeap()
        XCTAssertTrue(sut.isMinHeap(elements: [1,2,3,4]))
    }
}
