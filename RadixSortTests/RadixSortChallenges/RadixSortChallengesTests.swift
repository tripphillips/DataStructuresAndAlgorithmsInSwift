//
//  RadixSortChallengesTests.swift
//  RadixSortTests
//
//  Created by Trip Phillips on 5/26/22.
//

import Foundation
import XCTest

class RadixSortChallengesTests: XCTestCase {
    
    func test_lexicographicalSort_Challenge1() {
        
        var array = [500, 1345, 13, 459, 44, 999]
        array.lexicographicalSort()
        XCTAssertEqual(array, [13, 1345, 44, 459, 500, 999])
        
    }
    
}
