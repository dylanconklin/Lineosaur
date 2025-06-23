// swiftlint:disable:this file_name
//
//  Accessors.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 6/14/24.
//

import Foundation

extension Graph {
    func edges(from: Vertex, toward: Vertex, directional: Bool = true) -> Set<Edge> {
        Set<Edge>(edges.filter { edge in
            directional ? (edge.toward == toward && edge.from == from) :
            (Set<Vertex>(edge.vertices) == Set<Vertex>([from, toward]))
        })
    }

    func edges(connectedTo vertex: Vertex) -> Set<Edge> {
        Set(edges.filter { $0.vertices.contains(vertex) })
    }

    func edges(connectedTo vertices: any Collection<Vertex>) -> Set<Edge> {
        vertices.reduce(into: Set<Edge>()) { result, vertex in
            result.formUnion(self.edges(connectedTo: vertex))
        }
    }
}
