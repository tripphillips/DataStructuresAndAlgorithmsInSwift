//
//  Vertex.swift
//  Graph
//
//  Created by Trip Phillips on 6/1/22.
//

import Foundation

public struct Vertex<T> {
    public let index: Int
    public let data: T
}

extension Vertex: Hashable where T: Hashable {}
extension Vertex: Equatable where T: Equatable {}

extension Vertex: CustomStringConvertible {
    public var description: String {
        "\(index): \(data)"
    }
}
