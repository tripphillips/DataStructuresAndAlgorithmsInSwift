//
//  BinarySearchTests.swift
//  BinarySearchTests
//
//  Created by Trip Phillips on 5/10/22.
//

import XCTest
@testable import BinarySearch

class BinarySearchTests: XCTestCase {
    
    func test_binarySearch_OddArray() {
        let sut = makeOddCountArray()
        let result = sut.binarySearch(for: 3)
        XCTAssertEqual(result, sut.firstIndex(of: 3))
    }

    func test_binarySearch_EvenArray() {
        let sut = makeOddCountArray()
        let result = sut.binarySearch(for: 20)
        XCTAssertEqual(result, sut.firstIndex(of: 20))
    }
    
    private func makeOddCountArray() -> [Int] {
        return [1,3,4,5,8,11,15,20]
    }
    
    private func makeEvenCountArray() -> [Int] {
        return [1,3,4,5,8,11,15,20,31]
    }
}
