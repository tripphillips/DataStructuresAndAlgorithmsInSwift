//
//  StackTests.swift
//  StackTests
//
//  Created by Trip Phillips on 4/24/22.
//

import XCTest
@testable import Stack

class StackTests: XCTestCase {

    func test_initialize_withParam() {
        let sut: Stack<Int> = Stack<Int>([1,2,3,4,5])
        let expected =
        """
        ----top----
        5
        4
        3
        2
        1
        -----------
        """
        XCTAssertEqual(expected, sut.debugDescription)
    }
    
    func test_initialize_withLiteral() {
        let sut: Stack<Int> = [1,2,3,4,5]
        let expected =
        """
        ----top----
        5
        4
        3
        2
        1
        -----------
        """
        XCTAssertEqual(expected, sut.debugDescription)
    }
    
    func test_pop_returnsNilWithEmptyStack() {
        
        var sut = Stack<Int>()
        
        print(sut.debugDescription)
        
        XCTAssertNil(sut.pop())
    }
    
    func test_pop_returnsElementWithFilledStack() {
        
        var sut: Stack<Int> = [1,2,3,4,5]
        
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.pop(), 5)
    }
    
    func test_push_addsElementAtEndOfEmptyStack() {
        
        var sut = Stack<Int>()
        
        sut.push(6)
        
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.pop(), 6)
    }
    
    func test_pop_addsElementAtEndOfFilledStack() {
        
        var sut: Stack<Int> = [1,2,3,4,5]
        
        sut.push(6)
        
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.pop(), 6)
    }
    
    func test_peek_returnsNilForEmptyStack() {
        
        let sut = Stack<Int>()
        
        print(sut.debugDescription)
        
        XCTAssertNil(sut.peek())
    }
    
    func test_peek_returnsElementAtEndOfFilledStack() {
        
        let sut: Stack<Int> = [1,2,3,4,5]
        
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.peek(), 5)
    }
    
    func test_isEmpty_returnsTrueForEmptyStack() {
        let sut = Stack<Int>()
        
        print(sut.debugDescription)
        
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_isEmpty_returnsFalseForFilledStack() {
        let sut: Stack<Int> = [1,2,3,4,5]
        
        print(sut.debugDescription)
        
        XCTAssertFalse(sut.isEmpty())
    }
}
