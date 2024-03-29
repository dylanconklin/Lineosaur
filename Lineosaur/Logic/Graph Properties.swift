//
//  Graph Properties.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 10/15/23.
//

import Foundation

extension Graph {
    var isBipartite: Bool {
        var groupA = Set<Vertex>()
        var groupB = Set<Vertex>()

        if !vertices.isEmpty {
            isBipartite(selectedVertex: vertices.randomElement()!, &groupA, &groupB)
        }

        return groupA.isDisjoint(with: groupB)
    }

    func isBipartite(selectedVertex: Vertex,
                     _ groupA: inout Set<Vertex>,
                     _ groupB: inout Set<Vertex>,
                     _ group: Bool = true,
                     visitedEdges: Set<Edge> = Set<Edge>())
    {
        if group {
            groupA.insert(selectedVertex)
        } else {
            groupB.insert(selectedVertex)
        }
        let connectedEdges: Set<Edge> = edges(connectedTo: selectedVertex)
            .filter { $0.from != $0.to }
            .subtracting(visitedEdges)
        let visitedEdges: Set<Edge> = visitedEdges.union(connectedEdges)
        var connectedVertices: Set<Vertex> = connectedEdges.reduce(into: Set<Vertex>()) { $0.formUnion($1.vertices) }
        connectedVertices.remove(selectedVertex)
        for vertex in connectedVertices {
            isBipartite(selectedVertex: vertex, &groupA, &groupB, !group, visitedEdges: visitedEdges)
        }

        let leftoverVertices: Set<Vertex> = Set(vertices).subtracting(groupA).subtracting(groupB)
        if !leftoverVertices.isEmpty {
            isBipartite(selectedVertex: leftoverVertices.randomElement()!,
                        &groupA,
                        &groupB,
                        !group,
                        visitedEdges: visitedEdges)
        }
    }

    var isComplete: Bool {
        for vertex in vertices {
            let connectedVertices: [Vertex] = edges(connectedTo: vertex).flatMap { $0.vertices }
            if connectedVertices.count != vertices.count {
                return false
            }
        }
        return true
    }

    var isConnected: Bool {
        var connectedVertices: Set<Vertex> = vertices.isEmpty ? [] : [vertices.randomElement()!]
        var connectedEdges = Set<Edge>()
        while !edges(connectedTo: connectedVertices).subtracting(connectedEdges).isEmpty {
            let newEdges = edges(connectedTo: connectedVertices)
            connectedEdges.formUnion(newEdges)
            connectedVertices.formUnion(newEdges.flatMap { $0.vertices })
        }
        return Set(edges).subtracting(connectedEdges).isEmpty
    }

    var isCyclic: Bool {
        let graph: Graph = copy
        while !graph.leaves.isEmpty {
            graph.remove(graph.leaves)
        }
        return !graph.isEmpty
    }

    var isEmpty: Bool {
        edges.isEmpty && vertices.isEmpty
    }

    var isMulti: Bool {
        if loops.isEmpty {
            for vertex1 in vertices {
                for vertex2 in vertices where edges(from: vertex1, to: vertex2, directional: false).count > 1 {
                    return true
                }
            }
        }
        return false
    }

    var isSimple: Bool {
        for vertex1 in vertices {
            for vertex2 in vertices where edges(from: vertex1, to: vertex2, directional: false).count > 1 {
                return false
            }
        }
        return true
    }

    var isTree: Bool {
        isConnected && !isCyclic
    }

    var isTrivial: Bool {
        edges.count == 0 && vertices.count == 1
    }
}
