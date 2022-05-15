//
//  HeapTests.swift
//  HeapTests
//
//  Created by Trip Phillips on 5/14/22.
//

import XCTest
@testable import Heap

class HeapTests: XCTestCase {

    func test_insert_MaxHeap() {
        var sut = makeSUT(sort: >)
        sut.insert(2)
        XCTAssertNotNil(sut.index(of: 2, startingAt: 0))
    }
    
    func test_remove_MaxHeap() {
        var sut = makeSUT(sort: >)
        XCTAssertEqual(sut.remove(), 12)
    }
    
    func test_removeAt_MaxHeap() {
        var sut = makeSUT(sort: >)
        XCTAssertEqual(sut.remove(at: 0), 12)
    }
    
    func test_peek_MaxHeep() {
        let sut = makeSUT(sort: >)
        XCTAssertEqual(sut.peek(), 12)
    }
    
    func test_insert_MinHeap() {
        var sut = makeSUT(sort: <)
        sut.insert(2)
        XCTAssertNotNil(sut.index(of: 2, startingAt: 0))
    }
    
    func test_remove_MinHeap() {
        var sut = makeSUT(sort: <)
        XCTAssertEqual(sut.remove(), 1)
    }
    
    func test_removeAt_MinHeap() {
        var sut = makeSUT(sort: <)
        XCTAssertEqual(sut.remove(at: 0), 1)
    }
    
    func test_peek_MinHeep() {
        let sut = makeSUT(sort: <)
        XCTAssertEqual(sut.peek(), 1)
    }
    
    func test_merge_Heaps() {
        
        var sut1 = makeSUT(sort: <)
        XCTAssertEqual(sut1.peek(), 1)
        let sut2 = makeSUT2(sort: <)
        sut1.merge(sut2)
        XCTAssertEqual(sut1.peek(), -1)
    }
    
    private func makeSUT(sort: @escaping (Int, Int) -> Bool) -> Heap<Int> {
        return Heap<Int>(sort: sort, elements: [1,12,3,4,1,6,8,7])
    }
    
    private func makeSUT2(sort: @escaping (Int, Int) -> Bool) -> Heap<Int> {
        return Heap<Int>(sort: sort, elements: [-1,5,10,9,13,11])
    }
}
