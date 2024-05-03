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
    var modelContext
    @Query(sort: \Graph.lastAccessed, order: .reverse)
    var savedGraphs: [Graph]
    @State var showGraphNamer: Bool = false
    @State var graphName: String = ""
    @Environment(\.dismiss)
    var dismiss

    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter
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
                        graph.lastAccessed = Date.now
                        do {
                            try? modelContext.save()
                        }
                        dismiss()
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
