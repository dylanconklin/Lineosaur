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

    var body: some View {
        ZStack {
            if edges.isEmpty {
                AddingHelper(helpText: "Tap on + to add\nan edge to your graph")
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
