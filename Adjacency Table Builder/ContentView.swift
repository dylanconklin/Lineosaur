//
//  ContentView.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/19/23.
//

import SwiftData
import SwiftUI

/// Entry point into application
struct ContentView: View {
    @StateObject var graph = GraphData()

    var body: some View {
        ZStack {
            TabView {
                GraphEditor(graph: graph)
                    .tabItem {
                        VStack {
                            Label("Edit Graph", systemImage: "pencil")
                        }
                    }
                TableViewer(graph: graph)
                    .tabItem {
                        VStack {
                            Label("View Table", systemImage: "tablecells")
                        }
                    }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
