//
//  QuickSortTests.swift
//  QuickSortTests
//
//  Created by Trip Phillips on 5/27/22.
//

import XCTest
@testable import QuickSort

class QuickSortTests: XCTestCase {

    func test_quickSortNaive_1Element() {
        let elements = [1]
        let result = QuickSort.quickSortNaive(elements)
        XCTAssertEqual(result, [1])
    }
    
    func test_quickSortNaive_2Elements() {
        let elements = [2,1]
        let result = QuickSort.quickSortNaive(elements)
        XCTAssertEqual(result, [1,2])
    }
    
    func test_quickSortNaive_3Elements() {
        let elements = [2,1,4]
        let result = QuickSort.quickSortNaive(elements)
        XCTAssertEqual(result, [1,2,4])
    }
    
    func test_quickSortNaive_10Elements() {
        let elements = [2,1,9,4,3,8,10,5,6,7]
        let result = QuickSort.quickSortNaive(elements)
        XCTAssertEqual(result, [1,2,3,4,5,6,7,8,9,10])
    }
    
    func test_quickSortLumunto_1Element() {
        var elements = [1]
        QuickSort.quickSortLumunto(&elements, low: 0, high: elements.count - 1)
        XCTAssertEqual(elements, [1])
    }
    
    func test_quickSortLumunto_2Elements() {
        var elements = [2,1]
        QuickSort.quickSortLumunto(&elements, low: 0, high: elements.count - 1)
        XCTAssertEqual(elements, [1,2])
    }
    
    func test_quickSortLumunto_3Elements() {
        var elements = [2,1,4]
        QuickSort.quickSortLumunto(&elements, low: 0, high: elements.count - 1)
        XCTAssertEqual(elements, [1,2,4])
    }
    
    func test_quickSortLumunto_10Elements() {
        var elements = [2,1,9,4,3,8,10,5,6,7]
        QuickSort.quickSortLumunto(&elements, low: 0, high: elements.count - 1)
        XCTAssertEqual(elements, [1,2,3,4,5,6,7,8,9,10])
    }
    
    func test_quickSortHoare_1Element() {
        var elements = [1]
        QuickSort.quickSortHoare(&elements, low: 0, high: elements.count - 1)
        XCTAssertEqual(elements, [1])
    }
    
    func test_quickSortHoare_2Elements() {
        var elements = [2,1]
        QuickSort.quickSortHoare(&elements, low: 0, high: elements.count - 1)
        XCTAssertEqual(elements, [1,2])
    }
    
    func test_quickSortHoare_3Elements() {
        var elements = [2,1,4]
        QuickSort.quickSortHoare(&elements, low: 0, high: elements.count - 1)
        XCTAssertEqual(elements, [1,2,4])
    }
    
    func test_quickSortHoare_10Elements() {
        var elements = [2,1,9,4,3,8,10,5,6,7]
        QuickSort.quickSortHoare(&elements, low: 0, high: elements.count - 1)
        XCTAssertEqual(elements, [1,2,3,4,5,6,7,8,9,10])
    }
    
    func test_quickSortMedian_1Element() {
        var elements = [1]
        QuickSort.quickSortMedian(&elements, low: 0, high: elements.count - 1)
        XCTAssertEqual(elements, [1])
    }
    
    func test_quickSortMedian_2Elements() {
        var elements = [2,1]
        QuickSort.quickSortMedian(&elements, low: 0, high: elements.count - 1)
        XCTAssertEqual(elements, [1,2])
    }
    
    func test_quickSortMedian_3Elements() {
        var elements = [2,1,4]
        QuickSort.quickSortMedian(&elements, low: 0, high: elements.count - 1)
        XCTAssertEqual(elements, [1,2,4])
    }
    
    func test_quickSortMedian_10Elements() {
        var elements = [2,1,9,4,3,8,10,5,6,7]
        QuickSort.quickSortMedian(&elements, low: 0, high: elements.count - 1)
        XCTAssertEqual(elements, [1,2,3,4,5,6,7,8,9,10])
    }
    
    func test_quickSortDutchFlag_1Element() {
        var elements = [1]
        QuickSort.quickSortDutchFlag(&elements, low: 0, high: elements.count - 1)
        XCTAssertEqual(elements, [1])
    }
    
    func test_quickSortDutchFlag_2Elements() {
        var elements = [2,1]
        QuickSort.quickSortDutchFlag(&elements, low: 0, high: elements.count - 1)
        XCTAssertEqual(elements, [1,2])
    }
    
    func test_quickSortDutchFlag_3Elements() {
        var elements = [2,1,4]
        QuickSort.quickSortDutchFlag(&elements, low: 0, high: elements.count - 1)
        XCTAssertEqual(elements, [1,2,4])
    }
    
    func test_quickSortDutchFlag_10Elements() {
        var elements = [2,1,9,4,3,8,10,5,6,7]
        QuickSort.quickSortDutchFlag(&elements, low: 0, high: elements.count - 1)
        XCTAssertEqual(elements, [1,2,3,4,5,6,7,8,9,10])
    }
}
