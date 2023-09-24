//
//  EdgeCreator.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 9/22/23.
//

import SwiftUI

/// Simple form to input vertices and edges into graph
struct EdgeCreator: View {
    @Binding var edges: [Edge]
    @State private var from: String = ""
    @State private var to: String = ""
    @State private var weight: Double = 0
    @Environment(\.dismiss) var dismiss

    func insertEdge () {
        if !to.isEmpty && !from.isEmpty {
            edges = edges + [Edge(from: from, to: to, weight: weight)]
        }

        // Reset form input fields
        from = ""
        to = ""
        weight = 0
    }

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Done") {
                    insertEdge()
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
                            .keyboardType(.decimalPad)
                    }
                }
            }
            Button {
                insertEdge()
            } label: {
                Label("Add Edge", systemImage: "checkmark")
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    @State var edges: [Edge] = []
    return EdgeCreator(edges: $edges)
}
