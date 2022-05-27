//
//  QuickSortChallengesTests.swift
//  QuickSortTests
//
//  Created by Trip Phillips on 5/27/22.
//

import XCTest

class QuickSortChallengesTests: XCTestCase {

    func test_quickSortLumunto_1Element() {
        var elements = [1]
        elements.quickSort()
        XCTAssertEqual(elements, [1])
    }
    
    func test_quickSortLumunto_2Elements() {
        var elements = [2,1]
        elements.quickSort()
        XCTAssertEqual(elements, [1,2])
    }
    
    func test_quickSortLumunto_3Elements() {
        var elements = [2,1,4]
        elements.quickSort()
        XCTAssertEqual(elements, [1,2,4])
    }
    
    func test_quickSortLumunto_10Elements() {
        var elements = [2,1,9,4,3,8,10,5,6,7]
        elements.quickSort()
        XCTAssertEqual(elements, [1,2,3,4,5,6,7,8,9,10])
    }
    
}
