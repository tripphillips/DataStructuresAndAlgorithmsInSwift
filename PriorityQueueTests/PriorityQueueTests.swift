//
//  PriorityQueueTests.swift
//  PriorityQueueTests
//
//  Created by Trip Phillips on 5/15/22.
//

import XCTest
@testable import PriorityQueue

class PriorityQueueTests: XCTestCase {

    func test_isEmpty_EmptyPriorityQueue() {
        let sut = makeSUTEmpty()
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_isEmpty_PriorityQueue() {
        let sut = makeSUT()
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_peek_EmptyPriorityQueue() {
        let sut = makeSUTEmpty()
        XCTAssertNil(sut.peek)
    }
    
    func test_peek_PriorityQeueu() {
        let sut = makeSUT()
        XCTAssertEqual(sut.peek, 12)
    }
    
    func test_enqueue_EmptyPriorityQueue() {
        var sut = makeSUTEmpty()
        XCTAssertTrue(sut.enqueue(14))
        XCTAssertEqual(sut.peek, 14)
    }
    
    func test_enqueue_PriorityQueue() {
        var sut = makeSUT()
        XCTAssertTrue(sut.enqueue(14))
        XCTAssertEqual(sut.peek, 14)
    }
    
    func test_dequeue_EmptyPriorityQueue() {
        var sut = makeSUTEmpty()
        XCTAssertNil(sut.dequeue())
    }
    
    func test_dequeue_PriorityQueue() {
        var sut = makeSUT()
        XCTAssertEqual(sut.dequeue(), 12)
    }
    
    func test_dequeue_EmptyPriorityQueue2() {
        var sut = makeSUTEmpty()
        _ = sut.dequeue()
        XCTAssertNil(sut.dequeue())
    }
    
    func test_dequeue_PriorityQueue2() {
        var sut = makeSUT()
        _ = sut.dequeue()
        XCTAssertEqual(sut.dequeue(), 8)
    }

    private func makeSUT() -> PriorityQueue<Int> {
        return PriorityQueue<Int>(sort: >, elements: [1,12,3,4,1,6,8,7])
    }
    
    private func makeSUTEmpty() -> PriorityQueue<Int> {
        return PriorityQueue<Int>(sort: >, elements: [])
    }

}
