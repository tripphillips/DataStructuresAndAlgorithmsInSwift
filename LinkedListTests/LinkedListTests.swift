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
    

}
