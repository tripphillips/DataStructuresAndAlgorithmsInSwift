//
//  StackChallengeTests.swift
//  StackTests
//
//  Created by Trip Phillips on 4/26/22.
//

import XCTest

class StackChallengeTests: XCTestCase {
    
    // MARK: - Reverse An Array
    func test_reverseAnEmptyArray() {
        let testArray = [Int]()
        let sut = StackChallenge_1_ReverseAnArray(testArray)
        
        let result = sut.reverseArray()
        
        XCTAssertEqual(result, [])
    }
    
    func test_reverseAnSingleElementFilledArray() {
        let testArray = [5]
        let sut = StackChallenge_1_ReverseAnArray(testArray)
        
        let result = sut.reverseArray()
        let expected = [5]
        XCTAssertEqual(result, expected)
    }
    
    func test_reverseAnFilledArray() {
        let testArray = [1,2,3,4,5]
        let sut = StackChallenge_1_ReverseAnArray(testArray)
        
        let result = sut.reverseArray()
        let expected = [5,4,3,2,1]
        XCTAssertEqual(result, expected)
    }
    
    // MARK: - Balance Parantheses
    func test_balanceParanthesesShouldBeTrue() {
        let testStr = "h((e))llo(world)()"
        let sut = StackChallenge_2_BalanceParentheses(testStr)
        
        let result = sut.isStrWithParenthesesBalanced()
        
        XCTAssertTrue(result)
    }
    
    func test_balanceParanthesesShouldBeFalse() {
        let testStr = "(hello world"
        let sut = StackChallenge_2_BalanceParentheses(testStr)
        
        let result = sut.isStrWithParenthesesBalanced()
        
        XCTAssertFalse(result)
    }
    
    func test_balanceParanthesesShouldBeTrue2() {
        let testStr = "h([e])llo{world}()"
        let sut = StackChallenge_2_BalanceParentheses(testStr)
        
        let result = sut.isStrWithParenthesesBalanced()
        
        XCTAssertTrue(result)
    }
    
    func test_balanceParanthesesShouldBeFalse2() {
        let testStr = "(hello] world"
        let sut = StackChallenge_2_BalanceParentheses(testStr)
        
        let result = sut.isStrWithParenthesesBalanced()
        
        XCTAssertFalse(result)
    }
}
