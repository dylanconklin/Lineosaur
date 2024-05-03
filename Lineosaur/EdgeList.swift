//
//  EdgeList.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 8/4/23.
//

import SwiftData
import SwiftUI

/// List showing edges in the graph
internal struct EdgeList: View {
    @Bindable var graph: Graph
    @State private var showEdgeSection: Bool = true

    var body: some View {
        Section("Edges", isExpanded: $showEdgeSection) {
            ForEach($graph.edges, id: \.id, editActions: .delete) { edge in
                EdgeView(edge: edge)
            }
            .onDelete { offsets in
                withAnimation {
                    for offset in offsets {
                        graph.remove(graph.edges[offset])
                    }
                }
            }
        }
    }
}

#Preview("Empty List") {
    do {
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return List { EdgeList(graph: Graph()) }
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty List") {
    do {
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return List { EdgeList(graph: connectedGraph) }
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
