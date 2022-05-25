//
//  BigONSquaredSortsChallengesTests.swift
//  BigONSquaredSortsTests
//
//  Created by Trip Phillips on 5/24/22.
//

import XCTest

class BigONSquaredSortsChallengesTests: XCTestCase {
    
    func test_groupElements_Challenge1() {
        
        var collection = [1,1,3,2,1,4]
        BigONSquaredSortsChallenges.rightAlign(1, in: &collection)
        XCTAssertEqual(collection[5], 1)
        XCTAssertEqual(collection[4], 1)
        XCTAssertEqual(collection[3], 1)
        
    }
    
    func test_findFirstDuplicate_NoDuplicates_Challenge2() {
        let collection = [1,2,3,4,5,6]
        let result = BigONSquaredSortsChallenges.findFirstDuplicate(in: collection)
        XCTAssertNil(result)
    }
    
    func test_findFirstDuplicate_Duplicates_Challenge2() {
        let collection = [1,2,3,4,2,5,6]
        let result = BigONSquaredSortsChallenges.findFirstDuplicate(in: collection)
        XCTAssertEqual(result, 2)
    }

    func test_reverse_Challenge3() {
        var collection = [1,2,3,4,5,6,7,8,9,10]
        BigONSquaredSortsChallenges.reverse(&collection)
        XCTAssertEqual([10,9,8,7,6,5,4,3,2,1], collection)
    }

}
