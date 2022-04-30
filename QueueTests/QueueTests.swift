//
//  QueueTests.swift
//  QueueTests
//
//  Created by Trip Phillips on 4/29/22.
//

import XCTest
@testable import Queue

class QueueTests: XCTestCase {

    func tests_enqueue_QueueArray() {
        var sut = QueueArray<Int>()
        
        XCTAssertTrue(sut.enqueue(1))
        print(sut.description)
        XCTAssertEqual(sut.peek, 1)
    }
    
    func tests_dequeue_EmptyQueueArray() {
        var sut = QueueArray<Int>()
        
        print(sut.description)
        XCTAssertEqual(sut.dequeue(), nil)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func tests_dequeue_QueueArray() {
        var sut = QueueArray<Int>()
        
        XCTAssertTrue(sut.enqueue(1))
        XCTAssertTrue(sut.enqueue(2))
        XCTAssertTrue(sut.enqueue(3))
        XCTAssertTrue(sut.enqueue(4))
        print(sut.description)
        XCTAssertEqual(sut.dequeue(), 1)
        XCTAssertFalse(sut.isEmpty)
    }
    
    func tests_enqueue_QueueLinkedList() {
        var sut = QueueLinkedList<Int>()
        
        XCTAssertTrue(sut.enqueue(1))
        XCTAssertTrue(sut.enqueue(2))
        XCTAssertTrue(sut.enqueue(3))
        XCTAssertTrue(sut.enqueue(4))
        print(sut.description)
        XCTAssertEqual(sut.peek, 1)
    }
    
    func tests_dequeue_EmptyQueueLinkedList() {
        var sut = QueueLinkedList<Int>()
        
        print(sut.description)
        XCTAssertEqual(sut.dequeue(), nil)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func tests_dequeue_QueueLinkedList() {
        var sut = QueueLinkedList<Int>()
        
        XCTAssertTrue(sut.enqueue(1))
        XCTAssertTrue(sut.enqueue(2))
        XCTAssertTrue(sut.enqueue(3))
        XCTAssertTrue(sut.enqueue(4))
        print(sut.description)
        XCTAssertEqual(sut.dequeue(), 1)
        XCTAssertFalse(sut.isEmpty)
    }

}
