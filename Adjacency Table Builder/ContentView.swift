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
                EdgeList(graph: graph)
                    .tabItem {
                        Label("Edit Edges", systemImage: "point.topleft.down.curvedto.point.bottomright.up")
                    }
                VertexList(graph: graph)
                    .tabItem {
                        Label("Edit Vertices", systemImage: "smallcircle.circle")
                    }
                TableViewer(graph: graph)
                    .tabItem {
                        Label("View Table", systemImage: "tablecells")
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
