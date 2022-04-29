//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Trip Phillips on 4/27/22.
//

import XCTest
@testable import LinkedList

class LinkedListTests: XCTestCase {


    func test_initialize_LinkedListNode() {
        
        let sut = LinkedListNode(value: 1, next: nil)
        
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.value, 1)
        XCTAssertNil(sut.next)
    }
    
    func test_initialize_LinkedListNodeWithNext() {
        
        let next = LinkedListNode(value: 2, next: nil)
        let sut = LinkedListNode(value: 1, next: next)
        
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.value, 1)
        XCTAssertIdentical(sut.next, next)
    }
    
    func test_isEmpty_LinkedList() {
        let sut = LinkedList<Int>()
        
        XCTAssertTrue(sut.isEmpty)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        
    }
    
    func test_isNotEmpty_LinkedList() {
        var sut = LinkedList<Int>()
        sut.push(1)
        
        XCTAssertFalse(sut.isEmpty)
        XCTAssertNotNil(sut.head)
        XCTAssertNotNil(sut.tail)
    }
    
    func test_push_LinkedListNode() {
        var sut = LinkedList<Int>()
        sut.push(1)
        
        print(sut.debugDescription)
        XCTAssertNotNil(sut.head)
        XCTAssertNotNil(sut.tail)
        XCTAssertIdentical(sut.head, sut.tail)
    }
    
    func test_push_MultipleLinkedListNodes() {
        var sut = LinkedList<Int>()
        sut.push(1)
        sut.push(2)
        sut.push(3)
        
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.head?.value, 3)
        XCTAssertEqual(sut.head?.next?.value, 2)
        XCTAssertEqual(sut.tail?.value, 1)
    }
    
    func test_append_LinkedListNode() {
        var sut = LinkedList<Int>()
        sut.append(1)
        
        print(sut.debugDescription)
        
        XCTAssertIdentical(sut.head, sut.tail)
        XCTAssertNotNil(sut.head)
        XCTAssertNotNil(sut.tail)
    }
    
    func test_append_MultipleLinkedListNodes() {
        var sut = LinkedList<Int>()
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.head?.value, 1)
        XCTAssertEqual(sut.head?.next?.value, 2)
        XCTAssertEqual(sut.tail?.value, 3)
    }
    
    func test_nodeAtIndex_IndexExists() {
        let sut = makeLinkedListWithMultipleValuesAppended()
        
        print(sut.debugDescription)
        
        let nodeAtIndex = sut.node(at: 1)
        XCTAssertEqual(nodeAtIndex?.value, 2)
        XCTAssertNotNil(sut.head)
        XCTAssertNotNil(sut.tail)
    }
    
    func test_nodeAtIndex_IndexDoesNotExists() {
        let sut = LinkedList<Int>()
        
        print(sut.debugDescription)
        
        let nodeAtIndex = sut.node(at: 1)
        XCTAssertEqual(nodeAtIndex?.value, nil)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    func test_insert_AfterFirstNode() {
        var sut = makeLinkedListWithMultipleValuesAppended()
        
        let nodeAtIndex = sut.node(at: 0)!
        sut.insert(4, after: nodeAtIndex)
        
        print(sut.debugDescription)
        
        XCTAssertEqual(nodeAtIndex.next?.value, 4)
        XCTAssertNotNil(sut.head)
        XCTAssertNotNil(sut.tail)
    }
    
    func test_insert_AfterLastNode() {
        var sut = makeLinkedListWithMultipleValuesAppended()
        let nodeAtIndex = sut.node(at: 2)!
        
        sut.insert(4, after: nodeAtIndex)
        
        print(sut.debugDescription)
        
        XCTAssertEqual(nodeAtIndex.next?.value, 4)
        XCTAssertNotNil(sut.head)
        XCTAssertNotNil(sut.tail)
    }
    
    func test_insert_AfterOutOfBoundsNode() {
        var sut = makeLinkedListWithMultipleValuesAppended()
        let nodeAtIndex = sut.node(at: -1)!
        
        sut.insert(4, after: nodeAtIndex)
        
        print(sut.debugDescription)
        
        XCTAssertEqual(nodeAtIndex.next?.value, 4)
        XCTAssertNotNil(sut.head)
        XCTAssertNotNil(sut.tail)
    }
    
    func test_pop_EmptyLinkedList() {
        var sut = LinkedList<Int>()
        
        print(sut.debugDescription)
        
        XCTAssertNil(sut.pop())
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    func test_pop_SingleNodeLinkedList() {
        var sut = LinkedList<Int>()
        sut.push(1)
    
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.pop(), 1)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    func test_pop_MultipleNodeLinkedList() {
        var sut = makeLinkedListWithMultipleValuesAppended()
    
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.pop(), 1)
        XCTAssertEqual(sut.head?.value, 2)
        XCTAssertEqual(sut.tail?.value, 3)
    }
    
    func test_removeLast_EmptyLinkedList() {
        var sut = LinkedList<Int>()
        
        print(sut.debugDescription)
        
        XCTAssertNil(sut.removeLast())
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    func test_removeLast_SingleNodeLinkedList() {
        var sut = LinkedList<Int>()
        sut.push(1)
    
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.removeLast(), 1)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    func test_removeLast_MultipleNodeLinkedList() {
        var sut = makeLinkedListWithMultipleValuesAppended()
    
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.removeLast(), 3)
        XCTAssertEqual(sut.head?.value, 1)
        XCTAssertEqual(sut.tail?.value, 2)
    }
    
    func test_removeAfter_SingleNodeLinkedList() {
        var sut = LinkedList<Int>()
        sut.push(1)
        
        let nodeAtIndex = sut.node(at: 0)!
        
        print(sut.debugDescription)
        
        XCTAssertNil(sut.remove(after: nodeAtIndex))
        XCTAssertEqual(sut.head?.value, 1)
        XCTAssertEqual(sut.tail?.value, 1)
    }
    
    func test_removeAfter_MultipleNodeLinkedList() {
        var sut = makeLinkedListWithMultipleValuesAppended()
    
        let nodeAtIndex = sut.node(at: 0)!
        
        print(sut.debugDescription)
        
        XCTAssertEqual(sut.remove(after: nodeAtIndex), 2)
        XCTAssertEqual(sut.head?.value, 1)
        XCTAssertEqual(sut.tail?.value, 3)
    }
    
    func test_iterateThrough_LinkedList() {
        let sut = makeLinkedListWithMultipleValuesAppended()
        
        var resultArr = [Int]()
        
        for element in sut {
            resultArr.append(element)
        }
        
        XCTAssertEqual(resultArr, [1,2,3])
    }
    
    func test_subscriptStartIndex_LinkedList() {
        let sut = makeLinkedListWithMultipleValuesAppended()
        
        let result = sut[sut.startIndex]
        
        XCTAssertEqual(result, 1)
    }
    
    func test_subscriptEndIndex_LinkedList() {
        let sut = makeLinkedListWithMultipleValuesAppended()
        
        var resultArr = [Int]()
        
        for i in 0..<sut.count {
            resultArr.append(i + 1)
        }
        
        XCTAssertEqual(resultArr, [1,2,3])
    }

    
    func test_equalityIndex_LinkedList() {
        let sut = makeLinkedListWithMultipleValuesAppended()
        
        XCTAssertFalse(sut.startIndex == sut.endIndex)
    }
    
    func test_compareIndex_LinkedList() {
        let sut = makeLinkedListWithMultipleValuesAppended()
        
        XCTAssertFalse(sut.startIndex > sut.endIndex)
        XCTAssertFalse(sut.startIndex > sut.startIndex)
    }
    
    func test_reduceHigherOrderFunction_LinkedList() {
        
        let sut = makeLinkedListWithMultipleValuesAppended()
        
        let result = sut.reduce(0, +)
        
        XCTAssertEqual(result, 6)
    }
    
    // MARK: - Helper Methods
    
    func makeLinkedListWithMultipleValuesAppended() -> LinkedList<Int> {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        return linkedList
    }
}
