//
//  VertexList.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 8/25/23.
//

import SwiftUI

struct VertexList: View {
    @ObservedObject var graph: GraphData
    
    var body: some View {
        List {
            ForEach ($graph.G.verticesArray, id: \.self, editActions: .delete) { vertex in
                VertexView(vertex: vertex)
            }
        }
        .toolbar {
            EditButton()
        }
    }
}

struct VertexList_Previews: PreviewProvider {
    static var graph = GraphData()
    static var previews: some View {
        VertexList(graph: graph)
    }
}
