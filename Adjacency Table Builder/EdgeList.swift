//
//  EdgeList.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 8/4/23.
//

import SwiftUI

/// List showing edges in the graph
struct EdgeList: View {
    @Binding var graph: Graph
    @State private var showEdgeCreator: Bool = false

    let addEdgeTip = AddEdgeTip()

    var body: some View {
        ZStack {
            if graph.edges.isEmpty {
                VStack {
                    Spacer()
                    Text("Tap on + to add an edge to your graph")
                        .font(Comfortaa.body)
                        .frame(alignment: .center)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            } else {
                List {
                    ForEach($graph.edges, id: \.id, editActions: .delete) { edge in
                        EdgeView(edge: edge)
                            .contextMenu {
                                Button {
                                    graph.remove(edge.wrappedValue)
                                    graph.insert(edge.wrappedValue.copy)
                                } label: {
                                    Label("Flip Direction", systemImage: "arrow.left.arrow.right")
                                }
                                Button {
                                    graph.insert(edge.wrappedValue.copy)
                                } label: {
                                    Label("Duplicate", systemImage: "plus.square.on.square")
                                }
                            }
                    }
                }
            }
            Spacer()
                .toolbar {
                    EditButton()
                    Button {
                        showEdgeCreator = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .popoverTip(addEdgeTip)
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
