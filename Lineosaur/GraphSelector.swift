//
//  GraphSelector.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 2/5/24.
//

import SwiftData
import SwiftUI

struct GraphSelector: View {
    @Environment(\.modelContext)
    private var modelContext: ModelContext
    @Query(sort: \Graph.lastAccessed, order: .reverse)
    private var savedGraphs: [Graph]
    @State private var showGraphNamer: Bool = .init(false)
    @State private var graphName: String = ""
    @Environment(\.dismiss)
    private var dismiss: DismissAction

    private var dateFormatter: DateFormatter {
        let dateFormatter: DateFormatter = .init()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(savedGraphs) { graph in
                    VStack(alignment: .leading) {
                        Text(graph.name ?? "Untitled Graph")
                        Text("^[\(graph.edges.count) edge](inflect: true), "
                             + "^[\(graph.vertices.count) vertex](inflect: true)")
                        Text("Last Accessed: \(dateFormatter.string(from: graph.lastAccessed))")
                    }
                    .onTapGesture {
                        save(graph: graph)
                    }
                    .accessibilityAddTraits(.isButton)
                }
                .onDelete(perform: deleteGraph)
            }
            toolbar
        }
    }

    private var toolbar: some View {
        Spacer()
            .toolbar {
                Button("New Graph", systemImage: "plus") {
                    graphName = ""
                    showGraphNamer = true
                }
                .alert("Graph Name", isPresented: $showGraphNamer) {
                    TextField("Graph Name", text: $graphName, prompt: Text("Graph Name"))
                    Button("Add") {
                        graphName = graphName.trimmingCharacters(in: .whitespacesAndNewlines)
                        graphName = graphName.isEmpty ? "Unnamed Graph" : graphName
                        modelContext.insert(Graph(name: graphName))
                        do {
                            try? modelContext.save()
                        }
                        dismiss()
                    }
                }
            }
            .navigationTitle("Saved Graphs")
    }

    private func deleteGraph(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(savedGraphs[index])
        }
        do {
            try? modelContext.save()
        }
        if savedGraphs.isEmpty {
            modelContext.insert(Graph())
        }
        do {
            try? modelContext.save()
        }
    }

    private func save(graph: Graph) {
        graph.lastAccessed = Date.now
        do {
            try? modelContext.save()
        }
        dismiss()
    }
}

#Preview {
    do {
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return GraphSelector()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
