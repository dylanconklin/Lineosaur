//
//  GraphEditor.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 8/27/23.
//

import SwiftUI

struct GraphEditor: View {
    @Binding var graph: Graph
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
                EdgeList(edges: $graph.edges)
            case .vertices:
                VertexList(vertices: $graph.vertices)
            }
        }
    }
}

#Preview {
    @State var graph = Graph()
    return GraphEditor(graph: $graph)
}
