//
//  GraphTests.swift
//  GraphTests
//
//  Created by Trip Phillips on 6/1/22.
//

import XCTest
@testable import Graph

class GraphTests: XCTestCase {
    
    func test_createVertex_AdjacencyList() {
        let sut = AdjacencyList<Int>()
        let vertex = sut.createVertex(data: 1)
        XCTAssertEqual(vertex.data, 1)
        XCTAssertEqual(vertex.index, 0)
    }

    func test_createVertex_AdjacencyMatrix() {
        let sut = AdjacencyMatrix<Int>()
        let vertex = sut.createVertex(data: 1)
        XCTAssertEqual(vertex.data, 1)
        XCTAssertEqual(vertex.index, 0)
    }
    
    func test_addDirectedEdge_AdjacencyList() {
        let sut = AdjacencyList<Int>()
        let vertex1 = sut.createVertex(data: 0)
        let vertex2 = sut.createVertex(data: 1)
        sut.addDirectedEdge(from: vertex1, to: vertex2, weight: 1)
        XCTAssertEqual(sut.weight(from: vertex1, to: vertex2), 1)
        XCTAssertNil(sut.weight(from: vertex2, to: vertex1))
    }
    
    func test_addDirectedEdge_AdjacencyMatrix() {
        let sut = AdjacencyMatrix<Int>()
        let vertex1 = sut.createVertex(data: 0)
        let vertex2 = sut.createVertex(data: 1)
        sut.addDirectedEdge(from: vertex1, to: vertex2, weight: 1)
        XCTAssertEqual(sut.weight(from: vertex1, to: vertex2), 1)
        XCTAssertNil(sut.weight(from: vertex2, to: vertex1))
    }
    
    func test_addUnDirectedEdge_AdjacencyList() {
        let sut = AdjacencyList<Int>()
        let vertex1 = sut.createVertex(data: 0)
        let vertex2 = sut.createVertex(data: 1)
        sut.addUndirectedEdge(between: vertex1, and: vertex2, weight: 1)
        XCTAssertEqual(sut.weight(from: vertex1, to: vertex2), 1)
        XCTAssertEqual(sut.weight(from: vertex2, to: vertex1), 1)
    }
    
    func test_addUnDirectedEdge_AdjacencyMatrix() {
        let sut = AdjacencyMatrix<Int>()
        let vertex1 = sut.createVertex(data: 0)
        let vertex2 = sut.createVertex(data: 1)
        sut.addUndirectedEdge(between: vertex1, and: vertex2, weight: 1)
        XCTAssertEqual(sut.weight(from: vertex1, to: vertex2), 1)
        XCTAssertEqual(sut.weight(from: vertex2, to: vertex1), 1)
    }
    
    func test_addEdgeDirectedEdge_AdjacencyList() {
        let sut = AdjacencyList<Int>()
        let vertex1 = sut.createVertex(data: 0)
        let vertex2 = sut.createVertex(data: 1)
        sut.add(.directed, from: vertex1, to: vertex2, weight: 1)
        XCTAssertEqual(sut.weight(from: vertex1, to: vertex2), 1)
        XCTAssertNil(sut.weight(from: vertex2, to: vertex1))
    }
    
    func test_addEdgeDirectedEdge_AdjacencyMatrix() {
        let sut = AdjacencyMatrix<Int>()
        let vertex1 = sut.createVertex(data: 0)
        let vertex2 = sut.createVertex(data: 1)
        sut.add(.directed, from: vertex1, to: vertex2, weight: 1)
        XCTAssertEqual(sut.weight(from: vertex1, to: vertex2), 1)
        XCTAssertNil(sut.weight(from: vertex2, to: vertex1))
    }
    
    func test_addEdgeUnDirectedEdge_AdjacencyList() {
        let sut = AdjacencyList<Int>()
        let vertex1 = sut.createVertex(data: 0)
        let vertex2 = sut.createVertex(data: 1)
        sut.add(.undirected, from: vertex1, to: vertex2, weight: 1)
        XCTAssertEqual(sut.weight(from: vertex1, to: vertex2), 1)
        XCTAssertEqual(sut.weight(from: vertex2, to: vertex1), 1)
    }
    
    func test_addEdgeUnDirectedEdge_AdjacencyMatrix() {
        let sut = AdjacencyMatrix<Int>()
        let vertex1 = sut.createVertex(data: 0)
        let vertex2 = sut.createVertex(data: 1)
        sut.add(.undirected, from: vertex1, to: vertex2, weight: 1)
        XCTAssertEqual(sut.weight(from: vertex1, to: vertex2), 1)
        XCTAssertEqual(sut.weight(from: vertex2, to: vertex1), 1)
    }
    
    func test_edgesFromSource_AdjacencyList() {
        let sut = AdjacencyList<Int>()
        let vertex1 = sut.createVertex(data: 0)
        let vertex2 = sut.createVertex(data: 1)
        let vertex3 = sut.createVertex(data: 2)
        sut.add(.directed, from: vertex1, to: vertex2, weight: 1)
        sut.add(.directed, from: vertex1, to: vertex3, weight: 2)
        XCTAssertEqual(sut.edges(from: vertex1).count, 2)
    }
    
    func test_edgesFromSource_AdjacencyMatrix() {
        let sut = AdjacencyMatrix<Int>()
        let vertex1 = sut.createVertex(data: 0)
        let vertex2 = sut.createVertex(data: 1)
        let vertex3 = sut.createVertex(data: 2)
        sut.add(.directed, from: vertex1, to: vertex2, weight: 1)
        sut.add(.directed, from: vertex1, to: vertex3, weight: 2)
        XCTAssertEqual(sut.edges(from: vertex1).count, 2)
    }
    
    func test_weight_AdjacencyList() {
        let (signapore, detroit, sut) = makeAdjacencyListUndirectedSUT()
        let weight = sut.weight(from: signapore, to: detroit)
        XCTAssertEqual(weight, 500)
    }
    
    func test_weight_AdjacencyMatrix() {
        let (signapore, detroit, sut) = makeAdjacencyMatrixUndirectedSUT()
        let weight = sut.weight(from: signapore, to: detroit)
        XCTAssertEqual(weight, 500)
    }
    
    func test_RuizAndVincentSharedFriends_Challenge2() {
        let (vincent, ruiz, graph) = makeAdjacencyListUndirectedSUTForChallenge2()
        let vincentFriends = Set(graph.edges(from: vincent).map { $0.destination.data })
        let ruizFriends = Set(graph.edges(from: ruiz).map { $0.destination.data })
        let mutualFriends = vincentFriends.intersection(ruizFriends)
        XCTAssertEqual(mutualFriends.first, "cole")
    }
    
    func test_breadthFirstSearchIterative_AdjacencyList() {
        let (a, graph) = makeBasicAdjacencyListUndirectedSUT()
        let visited = graph.breathFirstSearchIterative(from: a).map { $0.data }
        XCTAssertEqual(visited, ["A", "B", "C", "D", "E", "F", "G", "H"])
    }
    
    func test_breadthFirstSearchIterative_AdjacencyMatrix() {
        let (a, graph) = makeBasicAdjacencyMatrixUndirectedSUT()
        let visited = graph.breathFirstSearchIterative(from: a).map { $0.data }
        XCTAssertEqual(visited, ["A", "B", "C", "D", "E", "F", "G", "H"])
    }
    
    func test_breadthFirstSearchRecursive_AdjacencyList() {
        let (a, graph) = makeBasicAdjacencyListUndirectedSUT()
        let visited = graph.breathFirstSearchRecursive(from: a).map { $0.data }
        XCTAssertEqual(visited, ["A", "B", "C", "D", "E", "F", "G", "H"])
    }
    
    func test_breadthFirstSearchRecursive_AdjacencyMatrix() {
        let (a, graph) = makeBasicAdjacencyMatrixUndirectedSUT()
        let visited = graph.breathFirstSearchRecursive(from: a).map { $0.data }
        XCTAssertEqual(visited, ["A", "B", "C", "D", "E", "F", "G", "H"])
    }
    
    private func makeBasicAdjacencyMatrixUndirectedSUT() -> (Vertex<String>, AdjacencyMatrix<String>) {
        let graph = AdjacencyMatrix<String>()
        
        let a = graph.createVertex(data: "A")
        let b = graph.createVertex(data: "B")
        let c = graph.createVertex(data: "C")
        let d = graph.createVertex(data: "D")
        let e = graph.createVertex(data: "E")
        let f = graph.createVertex(data: "F")
        let g = graph.createVertex(data: "G")
        let h = graph.createVertex(data: "H")

        graph.add(.undirected, from: a, to: b, weight: 1)
        graph.add(.undirected, from: a, to: c, weight: 1)
        graph.add(.undirected, from: a, to: d, weight: 1)
        graph.add(.undirected, from: b, to: e, weight: 1)
        graph.add(.undirected, from: c, to: f, weight: 1)
        graph.add(.undirected, from: c, to: g, weight: 1)
        graph.add(.undirected, from: e, to: h, weight: 1)
        graph.add(.undirected, from: e, to: f, weight: 1)
        graph.add(.undirected, from: f, to: g, weight: 1)
        
        return (a, graph)
    }
    
    private func makeBasicAdjacencyListUndirectedSUT() -> (Vertex<String>, AdjacencyList<String>) {
        let graph = AdjacencyList<String>()
        
        let a = graph.createVertex(data: "A")
        let b = graph.createVertex(data: "B")
        let c = graph.createVertex(data: "C")
        let d = graph.createVertex(data: "D")
        let e = graph.createVertex(data: "E")
        let f = graph.createVertex(data: "F")
        let g = graph.createVertex(data: "G")
        let h = graph.createVertex(data: "H")

        graph.addUndirectedEdge(between: a, and: b, weight: nil)
        graph.addUndirectedEdge(between: a, and: c, weight: nil)
        graph.addUndirectedEdge(between: a, and: d, weight: nil)
        graph.addUndirectedEdge(between: b, and: e, weight: nil)
        graph.addUndirectedEdge(between: e, and: h, weight: nil)
        graph.addUndirectedEdge(between: e, and: f, weight: nil)
        graph.addUndirectedEdge(between: f, and: c, weight: nil)
        graph.addUndirectedEdge(between: f, and: g, weight: nil)
        graph.addUndirectedEdge(between: c, and: g, weight: nil)
        
        return (a, graph)
    }
    
    private func makeAdjacencyMatrixUndirectedSUT() -> (Vertex<String>, Vertex<String>, AdjacencyMatrix<String>) {
        let graph = AdjacencyMatrix<String>()
        
        let singapore = graph.createVertex(data: "Singapore")
        let tokyo = graph.createVertex(data: "Tokyo")
        let hongKong = graph.createVertex(data: "Hong Kong")
        let detroit = graph.createVertex(data: "Detroit")
        let sanFrancisco = graph.createVertex(data: "San Francisco")
        let washingtonDC = graph.createVertex(data: "Washington DC")
        let austinTexas = graph.createVertex(data: "Austin Texas")
        let seattle = graph.createVertex(data: "Seattle")

        graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
        graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
        graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
        graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
        graph.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
        graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
        graph.add(.undirected, from: detroit, to: austinTexas, weight: 50)
        graph.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
        graph.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
        graph.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
        graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
        graph.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)
        
        return (singapore, tokyo, graph)
    }
    
    private func makeAdjacencyListUndirectedSUT() -> (Vertex<String>, Vertex<String>, AdjacencyList<String>) {
        let graph = AdjacencyList<String>()
        
        let singapore = graph.createVertex(data: "Singapore")
        let tokyo = graph.createVertex(data: "Tokyo")
        let hongKong = graph.createVertex(data: "Hong Kong")
        let detroit = graph.createVertex(data: "Detroit")
        let sanFrancisco = graph.createVertex(data: "San Francisco")
        let washingtonDC = graph.createVertex(data: "Washington DC")
        let austinTexas = graph.createVertex(data: "Austin Texas")
        let seattle = graph.createVertex(data: "Seattle")

        graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
        graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
        graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
        graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
        graph.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
        graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
        graph.add(.undirected, from: detroit, to: austinTexas, weight: 50)
        graph.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
        graph.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
        graph.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
        graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
        graph.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)
        
        return (singapore, tokyo, graph)
    }

    private func makeAdjacencyListUndirectedSUTForChallenge2() -> (Vertex<String>, Vertex<String>, AdjacencyList<String>) {
        let graph = AdjacencyList<String>()
        
        let vincent = graph.createVertex(data: "vincent")
        let chesley = graph.createVertex(data: "chesley")
        let ruiz = graph.createVertex(data: "ruiz")
        let patrick = graph.createVertex(data: "patrick")
        let ray = graph.createVertex(data: "ray")
        let sun = graph.createVertex(data: "sun")
        let cole = graph.createVertex(data: "cole")
        let kerry = graph.createVertex(data: "kerry")

        graph.add(.undirected, from: vincent, to: chesley, weight: 1)
        graph.add(.undirected, from: vincent, to: ruiz, weight: 1)
        graph.add(.undirected, from: vincent, to: patrick, weight: 1)
        graph.add(.undirected, from: ruiz, to: ray, weight: 1)
        graph.add(.undirected, from: ruiz, to: sun, weight: 1)
        graph.add(.undirected, from: patrick, to: cole, weight: 1)
        graph.add(.undirected, from: patrick, to: kerry, weight: 1)
        graph.add(.undirected, from: cole, to: ruiz, weight: 1)
        graph.add(.undirected, from: cole, to: vincent, weight: 1)
        
        return (vincent, ruiz, graph)
    }
}
