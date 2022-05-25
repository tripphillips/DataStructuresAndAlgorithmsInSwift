//
//  MergeSortTests.swift
//  MergeSortTests
//
//  Created by Trip Phillips on 5/25/22.
//

import XCTest
@testable import MergeSort

class MergeSortTests: XCTestCase {
    
    func test_mergeSort_1Element() {
        let elements = [1]
        let result = MergeSort.mergeSort(elements)
        XCTAssertEqual(result, [1])
    }
    
    func test_mergeSort_2Elements() {
        let elements = [2,1]
        let result = MergeSort.mergeSort(elements)
        XCTAssertEqual(result, [1,2])
    }
    
    func test_mergeSort_3Elements() {
        let elements = [2,1,4]
        let result = MergeSort.mergeSort(elements)
        XCTAssertEqual(result, [1,2,4])
    }
    
    func test_mergeSort_10Elements() {
        let elements = [2,1,9,4,3,8,10,5,6,7]
        let result = MergeSort.mergeSort(elements)
        XCTAssertEqual(result, [1,2,3,4,5,6,7,8,9,10])
    }

}
