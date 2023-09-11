//
//  GraphEditor.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 8/27/23.
//

import SwiftUI

struct GraphEditor: View {
    @ObservedObject var graph: GraphData
    @State var graphElement: GraphElements = .edges
    
    enum GraphElements {
        case edges
        case vertices
    }
    
    var body: some View {
        VStack {
            Picker("Type of graph to display", selection: $graphElement) {
                Text("Edges").tag(GraphElements.edges)
                Text("Vertices").tag(GraphElements.vertices)
            }
            .pickerStyle(.segmented)
            .padding()
            
            switch graphElement {
            case .edges:
                EdgeList(graph: graph)
            case .vertices:
                VertexList(graph: graph)
            }
        }
    }
}

#Preview {
    GraphEditor(graph: GraphData())
}
