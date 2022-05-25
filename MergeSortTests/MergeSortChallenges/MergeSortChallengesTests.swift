//
//  MergeSortChallengesTests.swift
//  MergeSortTests
//
//  Created by Trip Phillips on 5/25/22.
//

import XCTest

class MergeSortChallengesTests: XCTestCase {

    func test_mergeTwoSequences_Challenge1() {
        
        let list1 = [1,4,6,9,10]
        let list2 = [2,3,5,7,8]
        
        let result = Array(MergeSortChallenges.merge(first: list1, second: list2))
        XCTAssertEqual(result, [1,2,3,4,5,6,7,8,9,10])
    }

}
