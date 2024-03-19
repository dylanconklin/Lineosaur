//
//  VertexList.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 8/25/23.
//

import SwiftData
import SwiftUI

struct VertexList: View {
    @Bindable var graph: Graph

    var body: some View {
        ForEach($graph.vertices, id: \.self, editActions: .delete) { vertex in
            VertexView(vertex: vertex)
        }
    }
}

#Preview("Empty List") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return List { VertexList(graph: Graph()) }
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty List") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return List { VertexList(graph: connected_graph) }
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
