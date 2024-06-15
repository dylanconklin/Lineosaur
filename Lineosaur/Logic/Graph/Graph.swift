//
//  Graph.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/21/23.
//

/*
 * WARNING!!! READ BEFORE MODIFYING
 *
 * Graph expects certain behaviors of this file, and misunderstanding of how it expects to behave may cause
 * critical errors during calculations.
 *
 * In order to support graphs with disjoined (standalone) vertices, edges and vertices are stored separately.
 * To prevent errors elsewhere, _edges and _vertices are restricted to this file only.
 * It is highly suggested that any extensions made to Graph are done outside this file.
 * Do not modify this file if you do not know what you are doing.
 */

import Foundation
import SwiftData

typealias Vertex = String

enum GraphType {
    case given
    case mst
}

@Model
final class Graph: Equatable {
    private var _edges: Set<Edge>
    private var _vertices: Set<Vertex>
    var name: String?
    var lastAccessed: Date
    var edgeStyles: [UUID: EdgeStyle]
    var id: UUID

    /*
     * Accessors
     */

    /// Returns the vertices of the graph
    var vertices: [Vertex] {
        get {
            _vertices.sorted()
        }
        set {
            let newVertices: Set<Vertex> = .init(newValue)
            let difference: Set<Vertex> = .init(vertices).symmetricDifference(newVertices)

            if vertices.count < newVertices.count {
                _vertices.formUnion(difference)
            } else {
                difference.forEach(remove)
            }
        }
    }

    /// Returns edges of the graph, in the form of Edge objects in an array
    var edges: [Edge] {
        get {
            _edges.sorted { lhs, rhs in
                var result: Bool = lhs.weight < rhs.weight
                if lhs.from != rhs.from {
                    result = lhs.from < rhs.from
                } else if lhs.toward != rhs.toward {
                    result = lhs.toward < rhs.toward
                }
                return result
            }
        }
        set {
            let difference: Set<Edge> = .init(newValue).symmetricDifference(Set(edges))
            let addOrRemove: (Edge) -> Void = edges.count < newValue.count ? { (edge: Edge) in
                self.insert(edge)
            } : { (edge: Edge) in
                self.remove(edge)
            }
            difference.forEach(addOrRemove)
        }
    }

    init(
        graphEdges: any Collection<Edge> = Set<Edge>(),
        graphVertices: any Collection<Vertex> = Set<Vertex>(),
        name: String? = nil,
        edgeStyles: [UUID: EdgeStyle] = [UUID: EdgeStyle]()
    ) {
        self._edges = Set<Edge>(graphEdges)
        self._vertices = Set<Vertex>(graphVertices)
        self.name = name
        lastAccessed = Date.now
        self.edgeStyles = edgeStyles
        id = UUID()
    }

    static func == (lhs: Graph, rhs: Graph) -> Bool {
        lhs.edges == rhs.edges && lhs.vertices == rhs.vertices
    }

    /*
     * Modifiers
     */

    func deleteEdges() {
        _edges = Set<Edge>()
    }

    func deleteEdgesAndVertices() {
        deleteEdges()
        _vertices = Set<Vertex>()
    }

    func insert(_ edge: Edge, withStyle style: EdgeStyle? = nil) {
        _edges.insert(edge)
        insert(edge.from)
        insert(edge.toward)
        edgeStyles[edge.id] = style
    }

    func insert(_ vertex: Vertex) {
        _vertices.insert(vertex)
    }

    func remove(_ edge: Edge) {
        _edges.remove(edge)
    }

    func remove(_ vertex: Vertex) {
        _edges.filter { $0.vertices.contains(vertex) }.forEach(remove)
        _vertices.remove(vertex)
    }
}
