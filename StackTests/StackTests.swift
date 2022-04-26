//
//  StackTests.swift
//  StackTests
//
//  Created by Trip Phillips on 4/24/22.
//

import XCTest
@testable import Stack

class StackTests: XCTestCase {

    func test_pop_returnsNilWithEmptyStack() {
        
        var sut = Stack<Int>()
        
        XCTAssertNil(sut.pop())
    }

}
