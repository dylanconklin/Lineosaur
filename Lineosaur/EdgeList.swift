//
//  EdgeList.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 8/4/23.
//

import SwiftData
import SwiftUI

/// List showing edges in the graph
struct EdgeList: View {
    @Bindable var graph: Graph
    @State private var showEdgeSection = true
    
    var body: some View {
        Section("Edges", isExpanded: $showEdgeSection) {
            ForEach($graph.edges, id: \.id, editActions: .delete) { edge in
                EdgeView(edge: edge)
                    .contextMenu {
#warning("Neither Button works; Need to re-write")
                        Button("Flip Direction", systemImage: "arrow.left.arrow.right") {
                            graph.remove(edge.wrappedValue)
                            graph.insert(edge.wrappedValue.copy)
                        }
                        Button("Duplicate", systemImage: "plus.square.on.square", action: { graph.insert(edge.wrappedValue.copy) })
                    }
            }
        }
    }
}

#Preview("Empty List") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return List { EdgeList(graph: Graph()) }
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty List") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return List { EdgeList(graph: connected_graph) }
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
