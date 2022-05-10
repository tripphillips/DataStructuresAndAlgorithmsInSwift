//
//  TrieNode.swift
//  Trie
//
//  Created by Trip Phillips on 5/10/22.
//

import Foundation

public class TrieNode<Key: Hashable> {
    
    public var key: Key?
    
    public weak var parent: TrieNode?
    
    public var children: [Key: TrieNode] = [:]
    
    public var isTerminating: Bool = false
    
    init(key: Key?, parent: TrieNode?) {
        self.key = key
        self.parent = parent
    }
}
