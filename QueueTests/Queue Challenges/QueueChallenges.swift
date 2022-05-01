//
//  QueueChallenges.swift
//  QueueTests
//
//  Created by Trip Phillips on 5/1/22.
//

import Foundation
import Queue
import Stack

protocol BoardGameManager {
    associatedtype Player
    func nextPlayer() -> Player?
}

class QueueChallenge_1_BoardGameManager<T>: BoardGameManager {
    typealias Player = T
    private var queue: QueueArray<T>
    
    init(players: [Player]) {
        
        queue = QueueArray<T>()
        
        for player in players {
            queue.enqueue(player)
        }
    }
    
    func nextPlayer() -> Player? {
        guard let person = queue.dequeue() else {
            return nil
        }
        queue.enqueue(person)
        return person
    }
}

extension QueueArray {
    func reversed() -> QueueArray {
        var queue = self
        
        var stack = Stack<QueueArray.T>()
        
        while let element = queue.dequeue() {
            stack.push(element)
        }
        
        while let element = stack.pop() {
            queue.enqueue(element)
        }
        
        return queue
    }
}

enum Direction {
  case front
  case back
}

protocol Deque {
  associatedtype T
  var isEmpty: Bool { get }
  func peek(from direction: Direction) -> T?
  mutating func enqueue(_ element: T,
                        to direction: Direction) -> Bool
  mutating func dequeue(from direction: Direction) -> T?
}

struct DequeDoubleLinkedList<T>: Deque {
    
    private var list = DoublyLinkedList<T>()
    
    public init() {}
    
    var isEmpty: Bool {
        list.isEmpty
    }
    
    func peek(from direction: Direction) -> T? {
        switch direction {
        case .front: return list.first?.value
        case .back: return list.last?.value
        }
    }
    
    mutating func enqueue(_ element: T,
                          to direction: Direction) -> Bool {
        switch direction {
        case .front:
            list.prepend(element)
        case .back:
            list.append(element)
        }
        return true
    }
    
    mutating func dequeue(from direction: Direction) -> T? {
        switch direction {
        case .front:
            guard let firstListNode = list.first else { return nil }
            return list.remove(firstListNode)
        case .back:
            guard let lastListNode = list.last else { return nil }
            return list.remove(lastListNode)
        }
    }
}

extension DequeDoubleLinkedList: CustomStringConvertible {
  public var description: String {
    String(describing: list)
  }
}
