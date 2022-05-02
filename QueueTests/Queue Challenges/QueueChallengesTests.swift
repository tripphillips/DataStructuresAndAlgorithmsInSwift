//
//  QueueChallengesTests.swift
//  QueueTests
//
//  Created by Trip Phillips on 5/1/22.
//

import XCTest
import Queue

class QueueChallengesTests: XCTestCase {

    func test_QueueChallenge1() {
        
        let sut = QueueChallenge_1_BoardGameManager(players: [1,2,3,4,5])
        
        XCTAssertEqual(sut.nextPlayer(), 1)
        XCTAssertEqual(sut.nextPlayer(), 2)
        XCTAssertEqual(sut.nextPlayer(), 3)
        XCTAssertEqual(sut.nextPlayer(), 4)
        XCTAssertEqual(sut.nextPlayer(), 5)
        XCTAssertEqual(sut.nextPlayer(), 1)
    }
    
    func test_QueueChallenge2_Reversed() {
        
        var sut = QueueArray<Int>()
        _ = sut.enqueue(1)
        _ = sut.enqueue(2)
        _ = sut.enqueue(3)
        
        var result = sut.reversed()
        XCTAssertEqual(result.dequeue(), 3)
        XCTAssertEqual(result.dequeue(), 2)
        XCTAssertEqual(result.dequeue(), 1)
        XCTAssertTrue(result.isEmpty)
    }
    
    func test_QueueChallenge3_Deque() {
        
        var sut = DequeDoubleLinkedList<Int>()
        _ = sut.enqueue(1, to: .back)
        
        XCTAssertEqual(sut.peek(from: .front), 1)
        XCTAssertEqual(sut.peek(from: .back), 1)
        print(sut.description)
        
        _ = sut.enqueue(2, to: .front)
        XCTAssertEqual(sut.peek(from: .front), 2)
        XCTAssertEqual(sut.peek(from: .back), 1)
        print(sut.description)
        
        _ = sut.enqueue(3, to: .back)
        XCTAssertEqual(sut.peek(from: .front), 2)
        XCTAssertEqual(sut.peek(from: .back), 3)
        print(sut.description)
        
        _ = sut.enqueue(4, to: .back)
        XCTAssertEqual(sut.peek(from: .front), 2)
        XCTAssertEqual(sut.peek(from: .back), 4)
        print(sut.description)
        
        _ = sut.dequeue(from: .front)
        XCTAssertEqual(sut.peek(from: .front), 1)
        XCTAssertEqual(sut.peek(from: .back), 4)
        print(sut.description)
        
        _ = sut.dequeue(from: .back)
        XCTAssertEqual(sut.peek(from: .front), 1)
        XCTAssertEqual(sut.peek(from: .back), 3)
        print(sut.description)
        
    }
    
}
