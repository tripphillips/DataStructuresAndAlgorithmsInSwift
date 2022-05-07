//
//  BinarySearchTreeProtocols.swift
//  BinarySearchTree
//
//  Created by Trip Phillips on 5/7/22.
//

import Foundation
import BinaryTree

public protocol BinarySearchTreeInsertable {
    associatedtype T
    
    /// Inserts a value into a binary search tree
    /// - Parameters:
    ///     - value: The value to insert
    mutating func insert(_ value: T) 
}


public protocol BinarySearchTreeInspectable {
    associatedtype T
    
    func contains(_ value: T) -> Bool 
}

public protocol BinarySearchTreeRemovable {
    associatedtype T
    
    /// Removes a value in a binary search tree
    /// - Parameters:
    ///     - value: The value to remove
    mutating func remove(_ value: T)
}
