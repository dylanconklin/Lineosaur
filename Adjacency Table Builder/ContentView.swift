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
            GraphEditor(graph: $graph)
                .tabItem { Label("Edit", systemImage: "pencil") }
            TableViewer(graph: graph)
                .tabItem { Label("Table", systemImage: "tablecells") }
            GraphVizViewer(graph: graph)
                .tabItem { Label("View Graph", systemImage: "tree") }
            Settings()
                .tabItem { Label("Settings", systemImage: "gear") }
        }
    }
}

#Preview {
    ContentView()
}
