//
//  LinkedListChallengeTests.swift
//  LinkedListTests
//
//  Created by Trip Phillips on 4/29/22.
//

import XCTest

class LinkedListChallengeTests: XCTestCase {
    
    // MARK: - Challenge 1 Print Linked List in Reverse
    func test_revereseRecursive_linkedList() {
        
        let sut = LinkedListChallenge_1_Reverse(LinkedListChallengeTests.integerArray)
        var testArray = [Int]()
        sut.printInReverseRecursive(node: sut.linkedList.head, result: &testArray)
        XCTAssertEqual(testArray, LinkedListChallengeTests.reversedIntegerArray)
    }
    
    func test_revereseIterative_linkedList() {
        
        let sut = LinkedListChallenge_1_Reverse(LinkedListChallengeTests.integerArray)
        
        let result: [Int] = sut.printInReverseIterative()
        XCTAssertEqual(result, LinkedListChallengeTests.reversedIntegerArray)
    }
    
    // MARK: - Challenge 2 Find Middle Node
    func test_findMiddleNode_linkedListOddNodes() {
        
        let sut = LinkedListChallenge_2_MiddleNode(LinkedListChallengeTests.integerArray)
        
        let middleNode = sut.findMiddleNode()
        XCTAssertEqual(middleNode?.value, 3)
    }
    
    
    func test_findMiddleNode_linkedListEvenNodes() {
        
        let sut = LinkedListChallenge_2_MiddleNode(LinkedListChallengeTests.integerArray2)
        
        let middleNode = sut.findMiddleNode()
        XCTAssertEqual(middleNode?.value, 3)
    }
    
    func test_findMiddleNode_linkedListEvenManyNodes() {
        
        let sut = LinkedListChallenge_2_MiddleNode(LinkedListChallengeTests.integerArray3)
        
        let middleNode = sut.findMiddleNode()
        XCTAssertEqual(middleNode?.value, 5)
    }
    
    // MARK: - Challenge 3 Reverse Linked List
    func test_reverse_LinkedList() {
        let sut = LinkedListChallenge_3_ReverseLinkedList(LinkedListChallengeTests.integerArray)
        
        let reversed = sut.reverseLinkedList()
        
        var result = [Int]()
        var currentNode = reversed!.head
        while currentNode != nil {
            result.append(currentNode!.value)
            currentNode = currentNode?.next
        }
        
        XCTAssertEqual(result, LinkedListChallengeTests.reversedIntegerArray)
    }
    
    // MARK: - Challenge 4 Merge Two Lists
    func test_merge_LinkedList() {
        let sut = LinkedListChallenge_4_MergeLinkedLists(leftArray: LinkedListChallengeTests.integerArray, rightArray: LinkedListChallengeTests.integerArray3)
        
        let merged = sut.merge()
        
        var result = [Int]()
        var currentNode = merged?.head
        while currentNode != nil {
            result.append(currentNode!.value)
            currentNode = currentNode?.next
        }
        
        XCTAssertEqual(result, [1,1,2,2,3,3,4,4,5,5,6,7,8,9])
    }
    
    func test_merge_LinkedListLeft() {
        let sut = LinkedListChallenge_4_MergeLinkedLists(leftArray: LinkedListChallengeTests.integerArray, rightArray: [])
        
        let merged = sut.merge()
        
        var result = [Int]()
        var currentNode = merged?.head
        while currentNode != nil {
            result.append(currentNode!.value)
            currentNode = currentNode?.next
        }
        
        XCTAssertEqual(result, LinkedListChallengeTests.integerArray)
    }
    
    func test_merge_LinkedListRight() {
        let sut = LinkedListChallenge_4_MergeLinkedLists(leftArray: [], rightArray: LinkedListChallengeTests.integerArray3)
        
        let merged = sut.merge()
        
        var result = [Int]()
        var currentNode = merged?.head
        while currentNode != nil {
            result.append(currentNode!.value)
            currentNode = currentNode?.next
        }
        
        XCTAssertEqual(result, LinkedListChallengeTests.integerArray3)
    }
    
    func test_remove_LinkList() {
        let sut = LinkedListChallenge_5_RemoveAllOccurences([1,2,3,4,5,5,5])
        
        sut.removeAll(5)
        
        var result = [Int]()
        var currentNode = sut.linkedList.head
        while currentNode != nil {
            result.append(currentNode!.value)
            currentNode = currentNode?.next
        }
        
        XCTAssertFalse(result.contains(5))
    }
    
    // MARK: - Helper Methods 
    static let integerArray: [Int] = [1,2,3,4,5]
    static let integerArray2: [Int] = [1,2,3,4]
    static let integerArray3: [Int] = [1,2,3,4,5,6,7,8,9]
    static let reversedIntegerArray: [Int] = integerArray.reversed()
}
