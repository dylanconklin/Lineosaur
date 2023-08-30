//
//  GraphEditor.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 8/27/23.
//

import SwiftUI

struct GraphEditor: View {
    @ObservedObject var graph: GraphData
    
    var body: some View {
        TabView {
            EdgeList(graph: graph)
                .tabItem {
                    VStack {
                        Label("Edit Edges", systemImage: "smallcircle.filled.circle")
                    }
                }
            VertexList(graph: graph)
                .tabItem {
                    VStack {
                        Label("Edit Vertices", systemImage: "point.topleft.down.curvedto.point.bottomright.up")
                    }
                }
        }
    }
}

#Preview {
    GraphEditor(graph: GraphData())
}
