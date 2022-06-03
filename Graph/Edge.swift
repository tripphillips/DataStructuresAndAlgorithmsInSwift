//
//  Edge.swift
//  Graph
//
//  Created by Trip Phillips on 6/1/22.
//

import Foundation

public struct Edge<T> {
    public let source: Vertex<T>
    public let destination: Vertex<T>
    public let weight: Double?
}

extension Edge: Equatable where T: Equatable {}
