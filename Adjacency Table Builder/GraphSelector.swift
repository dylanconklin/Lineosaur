//
//  GraphSelector.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 2/5/24.
//

import SwiftData
import SwiftUI

struct GraphSelector: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Graph.lastAccessed, order: .reverse) var savedGraphs: [Graph]

    var body: some View {
        NavigationStack {
            List {
                ForEach(savedGraphs) { graph in
                    VStack {
                        Text("Last Accessed: \(graph.lastAccessed)")
                    }
                    .onTapGesture {
                        graph.lastAccessed = Date.now
                    }
                }
            }
            .toolbar {
                Button {
                    modelContext.insert(Graph())
                } label: {
                    Label("New Graph", systemImage: "plus")
                }
            }
            .navigationTitle("Saved Graphs")
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return GraphSelector()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
