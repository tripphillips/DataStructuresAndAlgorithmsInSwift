//
//  HeapSortChallengesTests.swift
//  HeapTests
//
//  Created by Trip Phillips on 5/26/22.
//

import XCTest

class HeapSortChallengesTests: XCTestCase {
    
    func test_heapSort_1Element() {
        var elements = [1]
        elements.heapSort()
        XCTAssertEqual(elements, [1])
    }
    
    func test_heapSort_2Elements() {
        var elements = [2,1]
        elements.heapSort()
        XCTAssertEqual(elements, [1,2])
    }
    
    func test_heapSort_3Elements() {
        var elements = [4,2,1]
        elements.heapSort()
        XCTAssertEqual(elements, [1,2,4])
    }
    
    func test_heapSort_10Elements() {
        var elements = [10,9,8,7,6,5,4,3,2,1]
        elements.heapSort()
        XCTAssertEqual(elements, [1,2,3,4,5,6,7,8,9,10])
    }

}
