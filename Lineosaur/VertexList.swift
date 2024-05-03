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
    @State private var showVertexSection = true

    var body: some View {
        Section("Vertices", isExpanded: $showVertexSection) {
            ForEach($graph.vertices, id: \.self, editActions: .delete) { vertex in
                Text(vertex.wrappedValue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
            }
            .onDelete { offsets in
                withAnimation {
                    for offset in offsets {
                        graph.remove(graph.vertices[offset])
                    }
                }
            }
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
        return List { VertexList(graph: connectedGraph) }
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
