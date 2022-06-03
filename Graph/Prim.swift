//
//  Prim.swift
//  Graph
//
//  Created by Trip Phillips on 6/2/22.
//

import Foundation
import PriorityQueue

public class Prim<T: Hashable> {
    
    public typealias Graph = AdjacencyList<T>
    
    public init() {}
    
    public func produceMinimumSpanningTree(for graph: Graph) -> (cost: Double, mst: Graph) {
        
        var cost = 0.0
        let mst = Graph()
        var visited = Set<Vertex<T>>()
        var priorityQueue = PriorityQueue<Edge<T>>(sort: {
            $0.weight ?? 0.0 < $1.weight ?? 0.0
        })
        
        mst.copyVertices(from: graph)
        
        guard let start = graph.vertices.first else { return (cost, mst) }
        
        visited.insert(start)
        addAvailableEdges(for: start,
                          in: graph,
                          check: visited,
                          to: &priorityQueue)
        
        while let smallestEdge = priorityQueue.dequeue() {
            
            let vertex = smallestEdge.destination
            
            guard !visited.contains(vertex) else { continue }
            
            visited.insert(vertex)
            cost += smallestEdge.weight ?? 0.0
            
            mst.add(.undirected,
                    from: smallestEdge.source,
                    to: smallestEdge.destination,
                    weight: smallestEdge.weight)
            
            addAvailableEdges(for: vertex,
                              in: graph,
                              check: visited,
                              to: &priorityQueue)
            
        }
        
        return (cost, mst)
    }
    
    internal func addAvailableEdges(for vertex: Vertex<T>,
                           in graph: Graph,
                           check visited: Set<Vertex<T>>,
                           to priorityQueue: inout PriorityQueue<Edge<T>>) {
        
        let neighborEdges = graph.edges(from: vertex)
        
        for edge in neighborEdges where !visited.contains(edge.destination) {
            _ = priorityQueue.enqueue(edge)
        }
    }
}
