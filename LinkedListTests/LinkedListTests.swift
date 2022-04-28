//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Trip Phillips on 4/27/22.
//

import XCTest
@testable import LinkedList

class LinkedListTests: XCTestCase {


    func test_initialize_LinkedListNode() {
        
        let sut = LinkedListNode(value: 1, next: nil)
        
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.value, 1)
        XCTAssertNil(sut.next)
    }
    
    func test_initialize_LinkedListNodeWithNext() {
        
        let next = LinkedListNode(value: 2, next: nil)
        let sut = LinkedListNode(value: 1, next: next)
        
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.value, 1)
        XCTAssertIdentical(sut.next, next)
    }
    
    func test_isEmpty_LinkedList() {
        let sut = LinkedList<Int>()
        
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_isNotEmpty_LinkedList() {
        var sut = LinkedList<Int>()
        sut.push(1)
        
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_push_LinkedListNode() {
        var sut = LinkedList<Int>()
        sut.push(1)
        
        print(sut.debugDescription)
        
        XCTAssertIdentical(sut.head, sut.tail)
    }
    
    func test_push_MultipleLinkedListNodes() {
        var sut = LinkedList<Int>()
        sut.push(1)
        sut.push(2)
        sut.push(3)
        
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.head?.value, 3)
        XCTAssertEqual(sut.head?.next?.value, 2)
        XCTAssertEqual(sut.tail?.value, 1)
    }
    
    func test_append_LinkedListNode() {
        var sut = LinkedList<Int>()
        sut.append(1)
        
        print(sut.debugDescription)
        
        XCTAssertIdentical(sut.head, sut.tail)
    }
    
    func test_append_MultipleLinkedListNodes() {
        var sut = LinkedList<Int>()
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.head?.value, 1)
        XCTAssertEqual(sut.head?.next?.value, 2)
        XCTAssertEqual(sut.tail?.value, 3)
    }
    
    func test_nodeAtIndex_IndexExists() {
        var sut = LinkedList<Int>()
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        print(sut.debugDescription)
        
        let nodeAtIndex = sut.node(at: 1)
        XCTAssertEqual(nodeAtIndex?.value, 2)
    }
    
    func test_nodeAtIndex_IndexDoesNotExists() {
        let sut = LinkedList<Int>()
        
        print(sut.debugDescription)
        
        let nodeAtIndex = sut.node(at: 1)
        XCTAssertEqual(nodeAtIndex?.value, nil)
    }
    
    func test_insert_AfterFirstNode() {
        var sut = LinkedList<Int>()
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        let nodeAtIndex = sut.node(at: 0)!
        sut.insert(4, after: nodeAtIndex)
        
        print(sut.debugDescription)
        
        XCTAssertEqual(nodeAtIndex.next?.value, 4)
    }
    
    func test_insert_AfterLastNode() {
        var sut = LinkedList<Int>()
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        let nodeAtIndex = sut.node(at: 2)!
        sut.insert(4, after: nodeAtIndex)
        
        print(sut.debugDescription)
        
        XCTAssertEqual(nodeAtIndex.next?.value, 4)
    }
    
    func test_insert_AfterOutOfBoundsNode() {
        var sut = LinkedList<Int>()
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        let nodeAtIndex = sut.node(at: -1)!
        sut.insert(4, after: nodeAtIndex)
        
        print(sut.debugDescription)
        
        XCTAssertEqual(nodeAtIndex.next?.value, 4)
    }
}
