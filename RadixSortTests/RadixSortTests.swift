//
//  RadixSortTests.swift
//  RadixSortTests
//
//  Created by Trip Phillips on 5/26/22.
//

import XCTest
@testable import RadixSort

class RadixSortTests: XCTestCase {

    func test_radixSort_1Element() {
        var elements = [1]
        elements.radixSort()
        XCTAssertEqual(elements, [1])
    }
    
    func test_radixSort_2Elements() {
        var elements = [2,1]
        elements.radixSort()
        XCTAssertEqual(elements, [1,2])
    }
    
    func test_radixSort_3Elements() {
        var elements = [2,1,4]
        elements.radixSort()
        XCTAssertEqual(elements, [1,2,4])
    }
    
    func test_radixSort_10Elements() {
        var elements = [2,1,9,4,3,8,10,5,6,7]
        elements.radixSort()
        XCTAssertEqual(elements, [1,2,3,4,5,6,7,8,9,10])
    }


}
