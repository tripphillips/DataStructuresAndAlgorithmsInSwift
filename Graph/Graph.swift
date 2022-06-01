//
//  Graph.swift
//  Graph
//
//  Created by Trip Phillips on 6/1/22.
//

import Foundation

public enum EdgeType {
    case directed
    case undirected
}

public protocol Graph {
    associatedtype T
    
    func createVertex(data: T) -> Vertex<T>
    func addDirectedEdge(from source: Vertex<T>,
                         to destination: Vertex<T>,
                         weight: Double?)
    func addUndirectedEdge(between source: Vertex<T>,
                           and destination: Vertex<T>,
                           weight: Double?)
    func add(_ edge: EdgeType,
             from source: Vertex<T>,
             to destination: Vertex<T>,
             weight: Double?)
    func edges(from source: Vertex<T>) -> [Edge<T>]
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double?
    
}

extension Graph {
    public func addUndirectedEdge(between source: Vertex<T>,
                                  and destination: Vertex<T>,
                                  weight: Double?) {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: source, to: destination, weight: weight)
    }
    
    public func add(_ edge: EdgeType,
                    from source: Vertex<T>,
                    to destination: Vertex<T>,
                    weight: Double?) {
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
}

extension Graph where T: Hashable {
    
    public func numberOfPaths(from source: Vertex<T>, to destination: Vertex<T>) -> Int {
        var numberOfPaths = 0
        var visited: Set<Vertex<T>> = []
        paths(from: source,
              to: destination,
              visited: &visited,
              pathCount: &numberOfPaths)
        return numberOfPaths
    }
    
    func paths(from source: Vertex<T>,
               to destination: Vertex<T>,
               visited: inout Set<Vertex<T>>,
               pathCount: inout Int) {
        
        visited.insert(source)
        
        if source == destination {
            pathCount += 1
        } else {
            let neighbors = edges(from: source)
            for edge in neighbors {
                if !visited.contains(edge.destination) {
                    paths(from: edge.destination,
                          to: destination,
                          visited: &visited,
                          pathCount: &pathCount)
                }
            }
        }
        
        visited.remove(source)
    }
}
