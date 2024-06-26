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
    @State private var toward: String = ""
    @State private var weight: Double = 0
    @State private var style: EdgeStyle = .init()
    @Environment(\.dismiss)
    private var dismiss: DismissAction

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    edgeDataForm
                    edgeStylePicker
                }
                addButton
            }
            .navigationTitle("Insert Edge")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Done") {
                    insertEdge()
                    dismiss()
                }
            }
        }
    }

    private var addButton: some View {
        Button("Add Edge", systemImage: "checkmark") { insertEdge() }
            .padding()
            .frame(maxWidth: .infinity, alignment: .bottom)
    }

    private var edgeStylePicker: some View {
        DisclosureGroup("Styling") {
            Picker("Arrowhead", selection: $style.arrowhead) {
                ForEach(EdgeStyle.Arrow.allCases, id: \.self) { arrow in
                    Text("\(arrow.description)")
                }
            }
            Picker("Arrowtail", selection: $style.arrowtail) {
                ForEach(EdgeStyle.Arrow.allCases, id: \.self) { arrow in
                    Text("\(arrow.description)")
                }
            }
        }
    }

    private var edgeDataForm: some View {
        Grid(alignment: .leading) {
            GridRow {
                VertexSelector(prompt: "From", value: $from, selection: graph.vertices)
            }
            GridRow {
                VertexSelector(prompt: "To", value: $toward, selection: graph.vertices)
            }
            GridRow {
                Text("Weight")
                Text(":")
                TextField(
                    "Weight",
                    text: Binding(
                        get: { String(weight) },
                        set: { weight = Double($0) ?? 0.0 }
                    )
                )
                .keyboardType(.decimalPad)
            }
        }
    }

    private func insertEdge() {
        from = from.trimmingCharacters(in: .whitespacesAndNewlines)
        toward = toward.trimmingCharacters(in: .whitespacesAndNewlines)

        if !toward.isEmpty && !from.isEmpty {
            graph.insert(Edge(from: from, toward: toward, weight: weight), withStyle: style)
        }

        // Reset form input fields
        from.removeAll()
        toward.removeAll()
        weight = 0
        style = EdgeStyle()
    }
}

#Preview("Empty List") {
    do {
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return EdgeCreator(graph: Graph())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty List") {
    do {
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return EdgeCreator(graph: graph2)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
