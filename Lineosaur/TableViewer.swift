//
//  TableViewer.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 8/25/23.
//

import SwiftData
import SwiftUI

/// Displays graph data as an adjacency table, using cells to display each data point
internal struct TableViewer: View {
    @Bindable internal var graph: Graph
    @State private var graphType: GraphType = .given
    @State private var showFacts: Bool = .init(false)

    internal var body: some View {
        NavigationStack {
            TableView(graph: graphType == .given ? graph : graph.mst)
            Spacer()
                .navigationTitle("Adjacency Table")
                .toolbar {
                    if !graph.edges.isEmpty {
                        ToolbarItem(placement: .topBarTrailing) {
                            Menu {
                                Button("Graph Facts", systemImage: "info.circle") { showFacts = true }
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
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return TableViewer(graph: Graph())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty Graph") {
    do {
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return TableViewer(graph: connectedGraph)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
