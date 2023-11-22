//
//  EdgeList.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 8/4/23.
//

import SwiftUI

/// List showing edges in the graph
struct EdgeList: View {
    @Binding var edges: [Edge]
    @State var showEdgeCreator: Bool = false

    let addEdgeTip = AddEdgeTip()

    var body: some View {
        ZStack {
            if edges.isEmpty {
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
                    ForEach($edges, id: \.self, editActions: .delete) { edge in
                        EdgeView(edge: edge)
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
                        EdgeCreator(edges: $edges)
                    }
                }
        }
    }
}

#Preview {
    @State var graph = Graph()
    return EdgeList(edges: $graph.edges)
}
