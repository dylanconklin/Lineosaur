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
    @State private var showFacts: Bool = .init(false)

    var graphFactsButton: some View {
        Button("Graph Facts", systemImage: "info.circle") {
            showFacts = true
        }
    }

    var graphTypeMenu: some View {
        Menu {
            Picker("Graph Type", selection: $graphType) {
                Text("Given").tag(GraphType.given)
                Text("MST").tag(GraphType.mst)
            }
        } label: {
            Label("Graph Type", systemImage: "square.on.circle")
        }
    }

    var body: some View {
        NavigationStack {
            TableView(graph: graphType == .given ? graph : graph.mst)
            Spacer()
                .navigationTitle("Adjacency Table")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        if !graph.edges.isEmpty {
                            Menu {
                                graphFactsButton
                                graphTypeMenu
                            } label: {
                                Label("Menu", systemImage: "ellipsis.circle")
                            }
                        } else {
                            graphFactsButton
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
