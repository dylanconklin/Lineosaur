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
                        Image(systemName: "smallcircle.filled.circle")
                        Text("Edit Edges")
                    }
                }
            VertexList(graph: graph)
                .tabItem {
                    VStack {
                        Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
                        Text("Edit Vertices")
                    }
                }
        }
    }
}

//#Preview {
//    GraphEditor()
//}
