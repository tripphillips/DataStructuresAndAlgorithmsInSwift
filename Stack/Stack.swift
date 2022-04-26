//
//  Stack.swift
//  Stack
//
//  Created by Trip Phillips on 4/24/22.
//

import Foundation
import Metal

public protocol Stackable {
    associatedtype Element
    
    /// Add an element to the top of the stack.
    mutating func push(_ element: Element)
    
    /// Removes and returns top element from the stack, if it existis.
    @discardableResult
    mutating func pop() -> Element?
    
    /// Returns the top element from the stack without removing it, if it exists.
    func peek() -> Element?
    
    /// Returns true if the stack is empty.
    func isEmpty() -> Bool
}


public struct Stack<Element>: Stackable {

    private var storage = [Element]()
    
    public init(_ elements: [Element]) {
        self.storage = elements
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    public func peek() -> Element? {
        return storage.last
    }
    
    public func isEmpty() -> Bool {
        return peek() == nil
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Element
    
    public init(arrayLiteral elements: ArrayLiteralElement...) {
        storage = elements
    }
    
}

public struct StackIterator<Element>: IteratorProtocol {
    private var storage = [Element]()
    
    init(_ storage: [Element]) {
        self.storage = storage
    }
    
    public mutating func next() -> Element? {
        return storage.popLast()
    }
}

extension Stack: Sequence {
    public func makeIterator() -> StackIterator<Element> {
        return StackIterator(storage)
    }
}

extension Stack: CustomDebugStringConvertible {
    
    public var debugDescription: String {
            """
            ----top----
            \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
            -----------
            """
    }
    
}
