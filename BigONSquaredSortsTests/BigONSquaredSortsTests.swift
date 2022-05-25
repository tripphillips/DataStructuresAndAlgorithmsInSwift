//
//  BigONSquaredSortsTests.swift
//  BigONSquaredSortsTests
//
//  Created by Trip Phillips on 5/23/22.
//

import XCTest
@testable import BigONSquaredSorts

class BigONSquaredSortsTests: XCTestCase {

    // MARK: - BubbleSort
    func test_bubbleSort_1Element() {
        var elements = [1]
        BigONSquaredSorts.bubbleSort(&elements)
        XCTAssertEqual(elements, [1])
    }
    
    func test_bubbleSort_2Elements() {
        var elements = [2,1]
        BigONSquaredSorts.bubbleSort(&elements)
        XCTAssertEqual(elements, [1,2])
    }
    
    func test_bubbleSort_3Elements() {
        var elements = [2,1,4]
        BigONSquaredSorts.bubbleSort(&elements)
        XCTAssertEqual(elements, [1,2,4])
    }
    
    func test_bubbleSort_10Elements() {
        var elements = [2,1,9,4,3,8,10,5,6,7]
        BigONSquaredSorts.bubbleSort(&elements)
        XCTAssertEqual(elements, [1,2,3,4,5,6,7,8,9,10])
    }
    
    // MARK: - Selection Sort
    func test_selectionSort_1Element() {
        var elements = [1]
        BigONSquaredSorts.selectionSort(&elements)
        XCTAssertEqual(elements, [1])
    }
    
    func test_selectionSort_2Elements() {
        var elements = [2,1]
        BigONSquaredSorts.selectionSort(&elements)
        XCTAssertEqual(elements, [1,2])
    }
    
    func test_selectionSort_3Elements() {
        var elements = [2,1,4]
        BigONSquaredSorts.selectionSort(&elements)
        XCTAssertEqual(elements, [1,2,4])
    }
    
    func test_selectionSort_10Elements() {
        var elements = [2,1,9,4,3,8,10,5,6,7]
        BigONSquaredSorts.selectionSort(&elements)
        XCTAssertEqual(elements, [1,2,3,4,5,6,7,8,9,10])
    }
    
    // MARK: - Insertion Sort
    func test_insertionSort_1Element() {
        var elements = [1]
        BigONSquaredSorts.insertionSort(&elements)
        XCTAssertEqual(elements, [1])
    }
    
    func test_insertionSort_2Elements() {
        var elements = [2,1]
        BigONSquaredSorts.insertionSort(&elements)
        XCTAssertEqual(elements, [1,2])
    }
    
    func test_insertionSort_3Elements() {
        var elements = [2,1,4]
        BigONSquaredSorts.insertionSort(&elements)
        XCTAssertEqual(elements, [1,2,4])
    }
    
    func test_insertionSort_10Elements() {
        var elements = [2,1,9,4,3,8,10,5,6,7]
        BigONSquaredSorts.insertionSort(&elements)
        XCTAssertEqual(elements, [1,2,3,4,5,6,7,8,9,10])
    }
}
