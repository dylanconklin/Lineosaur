//
//  ContentView.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/19/23.
//

import SwiftData
import SwiftUI

/// Entry point into application
struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Graph.lastAccessed, order: .reverse) var savedGraphs: [Graph]

    var graph: Graph {
        if savedGraphs.isEmpty {
            modelContext.insert(Graph())
            try! modelContext.save()
        }
        #warning("Check SwiftData issue, see comment below")
        // Do not change this to return savedGraphs.first!
        // It causes issues with SwiftData for some reason
        let graph = savedGraphs.first!
        return graph
    }

    var body: some View {
        TabView {
            GraphEditor(graph: graph)
                .tabItem { Label("Edit", systemImage: "pencil") }
            TableViewer(graph: graph)
                .tabItem { Label("Table", systemImage: "tablecells") }
            GraphVizViewer(graph: graph)
                .tabItem { Label("View Graph", systemImage: "point.3.connected.trianglepath.dotted") }
            Settings()
                .tabItem { Label("Settings", systemImage: "gear") }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)

        let testGraphs = [connected_graph, disconnected_graph_outlier_vertex, disconnected_graph_no_outlier_vertex]

        for graph in testGraphs {
            container.mainContext.insert(graph)
        }

        return ContentView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
