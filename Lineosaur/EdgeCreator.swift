//
//  EdgeCreator.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/22/23.
//

import SwiftData
import SwiftUI

struct VertexSelector: View {
    @State var prompt: String
    @Binding var value: String
    @State var selection: [String]

    var body: some View {
        Text(prompt)
        Text(":")
        HStack {
            TextField(prompt, text: $value)
            if !selection.isEmpty {
                Menu {
                    ForEach(selection, id: \.self) { val in
                        Button(val) {
                            value = val
                        }
                    }
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
        }
    }
}

/// Simple form to input vertices and edges into graph
struct EdgeCreator: View {
    @Bindable var graph: Graph
    @State private var from: String = ""
    @State private var to: String = ""
    @State private var weight: Double = 0
    @State private var style: EdgeStyle = EdgeStyle()
    @Environment(\.dismiss) private var dismiss

    func insertEdge() {
        from = from.trimmingCharacters(in: .whitespacesAndNewlines)
        to = to.trimmingCharacters(in: .whitespacesAndNewlines)

        if !to.isEmpty && !from.isEmpty {
            graph.insert(Edge(from: from, to: to, weight: weight), withStyle: style)
        }

        // Reset form input fields
        from.removeAll()
        to.removeAll()
        weight = 0
        style = EdgeStyle()
    }

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Grid(alignment: .leading) {
                        GridRow {
                            VertexSelector(prompt: "From", value: $from, selection: graph.vertices)
                        }
                        GridRow {
                            VertexSelector(prompt: "To", value: $to, selection: graph.vertices)
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
                Button("Add Edge", systemImage: "checkmark", action: { insertEdge() })
                    .padding()
                Spacer()
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
