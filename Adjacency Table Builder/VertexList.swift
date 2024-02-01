//
//  VertexList.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 8/25/23.
//

import SwiftUI

struct VertexList: View {
    @Binding var graph: Graph

    var body: some View {
        ZStack {
            if graph.vertices.isEmpty {
                VStack {
                    Spacer()
                    Text("Tap on + to add a vertex to your graph")
                        .font(Comfortaa.body)
                        .frame(alignment: .center)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            } else {
                List {
                    ForEach ($graph.vertices, id: \.self, editActions: .delete) { vertex in
                        VertexView(vertex: vertex)
                    }
                }
            }
        }
    }
}

#Preview("Empty List") {
    @State var graph: Graph = Graph()
    return VertexList(graph: $graph)
}

#Preview("Non-Empty List") {
    @State var graph: Graph = connected_graph
    return VertexList(graph: $graph)
}
