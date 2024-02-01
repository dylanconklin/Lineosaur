//
//  GraphEditor.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 8/27/23.
//

import SwiftUI

enum GraphElement {
    case edges
    case vertices
}

struct GraphEditor: View {
    @Binding var graph: Graph
    @State var graphElement: GraphElement = .edges
    @State private var showVertexBuilder: Bool = false
    @State private var showEdgeCreator: Bool = false
    @State private var vertexName: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Type of graph to display", selection: $graphElement) {
                    Text("Edges").tag(GraphElement.edges)
                    Text("Vertices").tag(GraphElement.vertices)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                switch graphElement {
                case .edges:
                    EdgeList(graph: $graph)
                case .vertices:
                    VertexList(graph: $graph)
                }

                Spacer()
                    .toolbar {
                        EditButton()

                        Button {
                            if graphElement == .vertices {
                                showVertexBuilder = true
                            } else if graphElement == .edges {
                                showEdgeCreator = true
                            }
                        } label: {
                            Image(systemName: "plus")
                        }
                        .popoverTip(AddElementTip())
                        .alert("Add Vertex", isPresented: $showVertexBuilder) {
                            TextField("Add Vertex", text: $vertexName, prompt: Text("Vertex Name"))
                            Button ("Cancel", role: .cancel) {
                                showVertexBuilder = false
                                vertexName = ""
                            }
                            Button ("Add") {
                                graph.vertices = graph.vertices + [vertexName]
                                vertexName = ""
                            }
                        }
                        .sheet(isPresented: $showEdgeCreator) {
                            EdgeCreator(graph: $graph)
                        }
                    }
            }
        }
        .navigationTitle("Graph Editor")
    }
}

#Preview("Edge List") {
    @State var graph = connected_graph
    return GraphEditor(graph: $graph, graphElement: .edges)
}

#Preview("Vertex List") {
    @State var graph = connected_graph
    return GraphEditor(graph: $graph, graphElement: .vertices)
}

#Preview("Empty Graph (Edge)") {
    @State var graph = Graph()
    return GraphEditor(graph: $graph, graphElement: .edges)
}

#Preview("Empty Graph (Vertex)") {
    @State var graph = Graph()
    return GraphEditor(graph: $graph, graphElement: .vertices)
}
