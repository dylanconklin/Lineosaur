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

    #warning("Fix sorting")
//    @Query(sort: \Graph.id) var savedGraphs: [Graph]
    @Query var savedGraphs: [Graph]

    var graph: Graph {
        savedGraphs.first ?? Graph()
    }

    var body: some View {
        TabView {
            GraphEditor(graph: graph)
                .tabItem { Label("Edit", systemImage: "pencil") }
            TableViewer(graph: graph)
                .tabItem { Label("Table", systemImage: "tablecells") }
            GraphVizViewer(graph: graph)
                .tabItem { Label("View Graph", systemImage: "tree") }
            Settings()
                .tabItem { Label("Settings", systemImage: "gear") }
        }
    }
}

#warning("Fix Preview so it doesn't crash")
//#Preview {
//    do {
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        let container = try ModelContainer(for: Graph.self, configurations: config)
//        return ContentView()
//            .modelContainer(container)
//    } catch {
//        fatalError("Failed to create model container")
//    }
//}
