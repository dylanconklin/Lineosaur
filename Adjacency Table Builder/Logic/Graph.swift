//
//  Graph.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/21/23.
//

import Foundation
import SwiftData
import SwiftUI

typealias Vertex = String

enum GraphType {
    case mst
    case given
}

@Model
class Graph: Equatable {
    private var graphEdges: Set<Edge> = []
    private var graphVertices: Set<Vertex> = []
    private var name: String?

    init(graphEdges: Set<Edge> = Set<Edge>(), graphVertices: Set<Vertex> = Set<Vertex>(), name: String? = nil) {
        self.graphEdges = graphEdges
        self.graphVertices = graphVertices
        self.name = name
    }

    static func ==(lhs: Graph, rhs: Graph) -> Bool {
        return lhs.graphEdges == rhs.graphEdges &&
        lhs.graphVertices == rhs.graphVertices
    }

    func insert(_ vertex: Vertex) {
        graphVertices.insert(vertex)
    }

    func insert(_ edge: Edge) {
        graphEdges.insert(edge)
        insert(edge.from)
        insert(edge.to)
    }

    func remove(_ vertex: Vertex) {
        graphEdges.filter({ $0.vertices.contains(vertex) }).forEach { edge in
            remove(edge)
        }
        graphVertices.remove(vertex)
    }

    func remove(_ vertices: any Collection<Vertex>) {
        vertices.forEach { vertex in
            remove(vertex)
        }
    }

    func remove(_ edge: Edge) {
        graphEdges.remove(edge)
    }

    func remove(_ edges: any Collection<Edge>) {
        edges.forEach { edge in
            remove(edge)
        }
    }

    /// Returns the vertices of the graph
    var vertices: [Vertex] {
        get {
            graphVertices.sorted()
        }
        set {
            let newVertices = Set<Vertex>(newValue)
            let difference = Set<Vertex>(vertices).symmetricDifference(newVertices)

            if vertices.count < newVertices.count {
                graphVertices.formUnion(difference)
            } else {
                difference.forEach { remove($0) }
            }
        }
    }

    /// Calculates the total cost of the graph
    /// The cost is the sum of the weight (length) of all the edges in the graph
    var cost: Double {
        edges.reduce(0.0, { $0 + $1.weight })
    }

    /// Generate the Minimum Spanning Tree (MST)
    /// - Returns: The MST Graph generated by the edges in the graph
    var mst: Graph {
        let G: Graph = self
        var vertices_left: Set<Vertex> = Set<Vertex>(G.vertices) // vertices that don't have an edge
        let MST: Graph = Graph()

        while let edge = G.edges.sorted(by: { $0.weight < $1.weight }).first(where: {
            let a = Set<Vertex>($0.vertices).intersection(vertices_left)
            let b = Set<Vertex>($0.vertices).intersection(MST.vertices)
            return !a.isEmpty && !b.isEmpty
        }) ?? (MST.isEmpty ? G.edges.sorted(by: { $0.weight < $1.weight }).first : nil) {
            MST.insert(edge)
            G.remove(edge)
            vertices_left.subtract(edge.vertices)
        }

        return MST
    }

    /// Returns edges of the graph, in the form of Edge objects in an array
    var edges: [Edge] {
        get {
            graphEdges.sorted(by: {
                if $0.from != $1.from {
                    return $0.from < $1.from
                } else if $0.to != $1.to {
                    return $0.to < $1.to
                } else {
                    return $0.weight < $1.weight
                }
            })
        }
        set {
            let difference = Set(newValue).symmetricDifference(Set(edges))
            let addOrRemove = edges.count < newValue.count ? { (edge: Edge) in
                self.insert(edge)
            } : { (edge: Edge) in
                self.remove(edge)
            }
            difference.forEach(addOrRemove)
        }
    }

    func edges(from: Vertex, to: Vertex, directional: Bool = true) -> Set<Edge> {
        var result: Set<Edge> = Set<Edge>()
        let f = directional ? { (from: Vertex, to: Vertex, edge: Edge) -> Bool in
            edge.to == to && edge.from == from
        } : { (from: Vertex, to: Vertex, edge: Edge) -> Bool in
            Set<Vertex>(edge.vertices) == Set<Vertex>(arrayLiteral: from, to)
        }

        edges.forEach { edge in
            if f(from, to, edge) {
                result.insert(edge)
            }
        }

        return result
    }

    func edges(connectedTo vertex: Vertex) -> Set<Edge> {
        return Set(edges.filter { $0.vertices.contains(vertex) })
    }

    func edges(connectedTo vertices: any Collection<Vertex>) -> Set<Edge> {
        return vertices.reduce(into: Set<Edge>()) { result, vertex in
            result.formUnion(self.edges(connectedTo: vertex))
        }
    }

    var leaves: Set<Vertex> {
        Set<Vertex>(vertices.filter { vertex in
            graphEdges.filter { $0.from == vertex }.isEmpty
        })
    }

    var loops: Set<Edge> {
        Set(edges.filter { $0.from == $0.to })
    }
}
