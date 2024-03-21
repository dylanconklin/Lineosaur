//
//  TableViewer.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 8/25/23.
//

import SwiftData
import SwiftUI

/// Displays graph data as an adjacency table, using cells to display each data point
struct TableViewer: View {
    @Bindable var graph: Graph
    @State private var graphType: GraphType = .given
    @State private var showFacts: Bool = false

    var body: some View {
        NavigationStack {
            TableView(graph: graphType == .given ? graph : graph.mst)
            Spacer()
                .navigationTitle("Adjacency Table")
                .toolbar {
                    if !graph.edges.isEmpty {
                        ToolbarItem(placement: .topBarTrailing) {
                            Menu {
                                Button("Graph Facts", systemImage: "info.circle", action: { showFacts = true })
                                Menu {
                                    Picker("Graph Type", selection: $graphType) {
                                        Text("Given").tag(GraphType.given)
                                        Text("MST").tag(GraphType.mst)
                                    }
                                } label: {
                                    Label("Graph Type", systemImage: "square.on.circle")
                                }
                            } label: {
                                Label("Menu", systemImage: "ellipsis.circle")
                            }
                        }
                    }
                }
                .sheet(isPresented: $showFacts) {
                    GraphFacts(graph: graph)
                }
        }
    }
}

#Preview("Empty Graph") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return TableViewer(graph: Graph())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty Graph") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return TableViewer(graph: connected_graph)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
