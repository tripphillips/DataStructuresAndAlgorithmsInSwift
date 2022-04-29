//
//  LinkedListChallengeTests.swift
//  LinkedListTests
//
//  Created by Trip Phillips on 4/29/22.
//

import XCTest
import LinkedList

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
        
        let sut = makeLinkedListWithMultipleValuesAppended1()
        
        let middleNode = sut.middleNode
        XCTAssertEqual(middleNode?.value, 4)
    }
    
    
    func test_findMiddleNode_linkedListEvenNodes() {
        
        let sut =  makeLinkedListWithMultipleValuesAppended2()
        
        let middleNode = sut.middleNode
        XCTAssertEqual(middleNode?.value, 3)
    }
    
    // MARK: - Challenge 3 Reverse Linked List
    func test_reverse_LinkedList() {
        var sut = makeLinkedListWithMultipleValuesAppended1()
        
        sut.reverse()
        
        var result = [Int]()
        var currentNode = sut.head
        while currentNode != nil {
            result.append(currentNode!.value)
            currentNode = currentNode?.next
        }
        
        XCTAssertEqual(result, LinkedListChallengeTests.integerArray4.reversed())
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
        var sut = makeLinkedListWithMultipleValuesAppended1()
        
        sut.removeAll(5)
        
        var result = [Int]()
        var currentNode = sut.head
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
    static let integerArray4: [Int] = [1,2,3,4,5,6,7]
    static let reversedIntegerArray: [Int] = integerArray.reversed()

    func makeLinkedListWithMultipleValuesAppended1() -> LinkedList<Int> {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        linkedList.append(4)
        linkedList.append(5)
        linkedList.append(6)
        linkedList.append(7)
        return linkedList
    }
    
    func makeLinkedListWithMultipleValuesAppended2() -> LinkedList<Int> {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        linkedList.append(4)
        return linkedList
    }
}
