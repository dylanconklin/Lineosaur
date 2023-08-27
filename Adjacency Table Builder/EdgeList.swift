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
    @ObservedObject var graph: GraphData
    @State private var from: String = ""
    @State private var to: String = ""
    @State private var weight: Double = 0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Done"){
                    dismiss()
                }
                .padding()
            }
            Form {
                HStack {
                    Text("To     :")
                    TextField("To", text: $to)
                    Spacer()
                }
                HStack {
                    Text("From   :")
                    TextField("From", text: $from)
                    Spacer()
                }
                HStack {
                    Text("Weight :")
                    TextField("weight",
                              text: Binding(
                                get: { String(weight) },
                                set: { weight = Double($0) ?? 0.0 }))
                    Spacer()
                }
            }
            .monospaced()
            Button {
                if !to.isEmpty && !from.isEmpty {
                    graph.G.insert(edge: Edge(vertices: Set<Vertex>([to, from]), weight: weight))
                }
                
                // Reset form input fields
                to = ""
                from = ""
                weight = 0
            } label: {
                HStack {
                    Image(systemName: "checkmark")
                    Text("Add Edge")
                }
            }
            .padding()
            Spacer()
        }
    }
}

/// List showing edges in the graph
struct EdgeList: View {
    @ObservedObject var graph: GraphData
    @State var showEdgeCreator: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach($graph.G.edgesArray, id: \.self, editActions: .delete) { edge in
                        EdgeView(from: edge.verticesArray[0], to: edge.verticesArray[1], weight: edge.weight)
                    }
                }
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button {
                            showEdgeCreator = true
                        } label: {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $showEdgeCreator) {
                            EdgeCreator(graph: graph)
                        }
                    }
                }
            }
        }
    }
}

struct EdgeList_Previews: PreviewProvider {
    static var graph = GraphData()
    static var previews: some View {
        EdgeList(graph: graph)
    }
}
