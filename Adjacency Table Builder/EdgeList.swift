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
        }
    }
}

#Preview("Empty List") {
    @State var graph = Graph()
    return EdgeList(graph: $graph)
}

#Preview("Non-Empty List") {
    @State var graph = connected_graph
    return EdgeList(graph: $graph)
}
