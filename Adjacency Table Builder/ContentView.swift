//
//  ContentView.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/19/23.
//

import SwiftUI

/// Entry point into application
struct ContentView: View {
    @State var graph: Graph = Graph()

    var body: some View {
        TabView {
            EdgeList(edges: $graph.edges)
                .tabItem { Label("Edges", systemImage: "point.topleft.down.curvedto.point.bottomright.up") }
            VertexList(vertices: $graph.vertices)
                .tabItem { Label("Vertices", systemImage: "smallcircle.circle") }
            TableViewer(graph: graph)
                .tabItem { Label("Table", systemImage: "tablecells") }
        }
    }
}

#Preview {
    ContentView()
}
