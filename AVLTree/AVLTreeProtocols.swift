//
//  AVLTreeProtocols.swift
//  AVLTree
//
//  Created by Trip Phillips on 5/7/22.
//

import Foundation

public protocol AVLTreeInsertable {
    associatedtype T
    
    /// Inserts a value into a binary search tree
    /// - Parameters:
    ///     - value: The value to insert
    mutating func insert(_ value: T)
}


public protocol AVLTreeInspectable {
    associatedtype T
    
    func contains(_ value: T) -> Bool
}

public protocol AVLTreeRemovable {
    associatedtype T
    
    /// Removes a value in a binary search tree
    /// - Parameters:
    ///     - value: The value to remove
    mutating func remove(_ value: T)
}
