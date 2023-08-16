//
//  TableBuilder.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 8/4/23.
//

import SwiftData
import SwiftUI

struct EdgeCreator: View {
    @Binding var showing: Bool
    @Bindable var graph: GraphData
    @State private var from: String = ""
    @State private var to: String = ""
    @State private var weight: Double = 0

    var body: some View {
        if showing {
            ZStack {
                Color(Color.gray)
                VStack {
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
                    Button {
                        graph.G.insert(edge: Edge(vertices: Set<Vertex>([to, from]), weight: weight))
                        to = ""
                        from = ""
                        weight = 0
                        showing = false
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
            .fontDesign(Font.Design.monospaced)
        }
    }
}

struct TableBuilder: View {
    @Bindable var graph: GraphData
    @State var showEdgeCreator: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach($graph.G.edgesArray, id: \.self, editActions: .delete) { edge in
                        EdgeBuilder(from: edge.verticesArray[0], to: edge.verticesArray[1], weight: edge.weight)
                    }
                }
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button {
                            showEdgeCreator = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                EdgeCreator(showing: $showEdgeCreator, graph: graph)
            }
        }
    }
}

struct TableBuilder_Previews: PreviewProvider {
    static var graph = GraphData()
    static var previews: some View {
        TableBuilder(graph: graph)
    }
}
