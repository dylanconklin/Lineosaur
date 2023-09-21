//
//  EdgeList.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 8/4/23.
//

import SwiftData
import SwiftUI

/// Simple form to input vertices and edges into graph
struct EdgeCreator: View {
    @Binding var graph: Graph
    @State private var from: String = ""
    @State private var to: String = ""
    @State private var weight: Double = 0
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Done") {
                    dismiss()
                }
                .padding()
            }
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
                    }
                }
            }
            Button {
                if !to.isEmpty && !from.isEmpty {
                    graph.insert(Edge(from: from, to: to, weight: weight))
                }

                // Reset form input fields
                from = ""
                to = ""
                weight = 0
            } label: {
                Label("Add Edge", systemImage: "checkmark")
            }
            .padding()
            Spacer()
        }
    }
}

/// List showing edges in the graph
struct EdgeList: View {
    @Binding var graph: Graph
    @State var showEdgeCreator: Bool = false

    var body: some View {
        NavigationStack {
            List {
                ForEach($graph.edges, id: \.self, editActions: .delete) { edge in
                    EdgeView(edge: edge)
                }
            }
            .navigationTitle("Edges")
            .toolbar {
                EditButton()
                Button {
                    showEdgeCreator = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showEdgeCreator) {
                    EdgeCreator(graph: $graph)
                }
            }
        }
    }
}

#Preview {
    @State var graph = Graph()
    return EdgeList(graph: $graph)
}
