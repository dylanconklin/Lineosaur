//
//  ContentView.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/19/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @StateObject var graph = GraphData()

    var body: some View {
        NavigationStack {
            List {
                Section ("Builder") {
                    NavigationLink("Build Table") {
                        TableBuilder(graph: graph)
                            .navigationTitle("Table Builder")
                    }
                }
                Section ("Viewers") {
                    NavigationLink("View Given Table") {
                        TableView(G: graph.G)
                            .navigationTitle("Given Tree")
                    }
                    NavigationLink("View Minimum Spanning Tree") {
                        TableView(G: graph.MST)
                            .navigationTitle("Min. Spanning Tree")
                    }
                }
            }
            .navigationTitle("Adjacency Table Builder")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
