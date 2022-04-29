//
//  LinkedListChallengeTests.swift
//  LinkedListTests
//
//  Created by Trip Phillips on 4/29/22.
//

import XCTest

class LinkedListChallengeTests: XCTestCase {
    
    func test_revereseRecursive_linkedList() {
        
        let sut = LinkedListChallenge_1_Reverse(LinkedListChallengeTests.integerArray)
        var testArray = [Int]()
        sut.printInReverseRecursive(result: &testArray)
        XCTAssertEqual(testArray, LinkedListChallengeTests.reversedIntegerArray)
    }
    
    func test_revereseIterative_linkedList() {
        
        let sut = LinkedListChallenge_1_Reverse(LinkedListChallengeTests.integerArray)
        
        let result: [Int] = sut.printInReverseIterative()
        XCTAssertEqual(result, LinkedListChallengeTests.reversedIntegerArray)
    }
    
    // MARK: - Helper Methods 
    static let integerArray: [Int] = [1,2,3,4,5]
    static let reversedIntegerArray: [Int] = integerArray.reversed()
}
