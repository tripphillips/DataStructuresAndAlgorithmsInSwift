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
        let elements = [1]
        let result = elements.radixSort()
        XCTAssertEqual(result, [1])
    }
    
    func test_radixSort_2Elements() {
        let elements = [2,1]
        let result = elements.radixSort()
        XCTAssertEqual(result, [1,2])
    }
    
    func test_radixSort_3Elements() {
        let elements = [2,1,4]
        let result = elements.radixSort()
        XCTAssertEqual(result, [1,2,4])
    }
    
    func test_mradixSort_10Elements() {
        let elements = [2,1,9,4,3,8,10,5,6,7]
        let result = elements.radixSort()
        XCTAssertEqual(result, [1,2,3,4,5,6,7,8,9,10])
    }


}
