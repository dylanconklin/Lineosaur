//
//  EdgeCreator.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/22/23.
//

import SwiftData
import SwiftUI

/// Simple form to input vertices and edges into graph
struct EdgeCreator: View {
    @Bindable var graph: Graph
    @State private var from: String = ""
    @State private var to: String = ""
    @State private var weight: Double = 0
    @Environment(\.dismiss) private var dismiss

    func insertEdge() {
        from = from.trimmingCharacters(in: .whitespacesAndNewlines)
        to = to.trimmingCharacters(in: .whitespacesAndNewlines)

        if !to.isEmpty && !from.isEmpty {
            graph.insert(Edge(from: from, to: to, weight: weight))
        }

        // Reset form input fields
        from.removeAll()
        to.removeAll()
        weight = 0
    }

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Grid(alignment: .leading) {
                        GridRow {
                            Text("From")
                            Text(":")
                            TextField("From", text: $from)
                        }
                        GridRow {
                            Text("To")
                            Text(":")
                            TextField("To", text: $to)
                        }
                        GridRow {
                            Text("Weight")
                            Text(":")
                            TextField("Weight",
                                      text: Binding(
                                        get: { String(weight) },
                                        set: { weight = Double($0) ?? 0.0 }))
                            .keyboardType(.decimalPad)
                        }
                    }
                }
                Button("Add Edge", systemImage: "checkmark", action: { insertEdge() })
                    .padding()
                Spacer()
            }
            .navigationTitle("Insert Edge")
            .toolbar {
                Button("Done") {
                    insertEdge()
                    dismiss()
                }
            }
        }
    }
}

#Preview("Empty List") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return EdgeCreator(graph: Graph())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty List") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return EdgeCreator(graph: connected_graph)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
