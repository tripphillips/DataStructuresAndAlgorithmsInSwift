//
//  Graph.swift
//  Graph
//
//  Created by Trip Phillips on 6/1/22.
//

import Foundation
import Queue
import Stack

public enum EdgeType {
    case directed
    case undirected
}

public protocol Graph {
    associatedtype T
    
    var allVertices: [Vertex<T>] { get }
    
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
        addDirectedEdge(from: destination, to: source, weight: weight)
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

// MARK: - Breadth First Search
extension Graph where T: Hashable {
    
    public func breathFirstSearchIterative(from source: Vertex<T>) -> [Vertex<T>] {
        
        var queue = QueueDoubleStack<Vertex<T>>()
        var enqueued = Set<Vertex<T>>()
        var visited = [Vertex<T>]()
        
        _ = queue.enqueue(source)
        enqueued.insert(source)
        
        while let vertex = queue.dequeue() {
            visited.append(vertex)
            
            let neighborEdges = edges(from: vertex)
            
            for edge in neighborEdges where !enqueued.contains(edge.destination) {
                _ = queue.enqueue(edge.destination)
                enqueued.insert(edge.destination)
            }
        
        }
        
        return visited
    }
    
    public func breathFirstSearchRecursive(from source: Vertex<T>) -> [Vertex<T>] {
        
        var queue = QueueDoubleStack<Vertex<T>>()
        var enqueued = Set<Vertex<T>>()
        var visited = [Vertex<T>]()
        
        _ = queue.enqueue(source)
        enqueued.insert(source)
        
        return bfs(queue: &queue, visited: &visited, enqueued: &enqueued)
    }
    
    private func bfs(queue: inout QueueDoubleStack<Vertex<T>>, visited: inout [Vertex<T>], enqueued: inout Set<Vertex<T>>) -> [Vertex<T>] {
        
        guard let currentVertex = queue.dequeue() else { return visited }
        
        visited.append(currentVertex)
        
        let neighborEdges = edges(from: currentVertex)
        
        for edge in neighborEdges where !enqueued.contains(edge.destination) {
            _ = queue.enqueue(edge.destination)
            enqueued.insert(edge.destination)
        }
        
        return bfs(queue: &queue, visited: &visited, enqueued: &enqueued)
    }
}

// MARK: - Breadth First Search Challenge 3 Disconnected Graph
extension Graph where T: Hashable {
    
    public var isConnected: Bool {
        guard let firstVertex = allVertices.first else { return false }
        return breathFirstSearchRecursive(from: firstVertex).count == allVertices.count ? true : false
    }
    
}

// MARK: - Depth First Search
extension Graph where T: Hashable {
    
    public func depthFirstSearchIterative(from source: Vertex<T>) -> [Vertex<T>] {
        
        var stack = Stack<Vertex<T>>()
        var pushed = Set<Vertex<T>>()
        var visited = [Vertex<T>]()
        
        stack.push(source)
        pushed.insert(source)
        
        while let vertex = stack.pop() {
            
            visited.append(vertex)
            
            let neighborEdges = edges(from: vertex)
            
            for edge in neighborEdges where !pushed.contains(edge.destination) {
                stack.push(edge.destination)
                pushed.insert(edge.destination)
            }
            
        }
        
        return visited
    }
    
}
