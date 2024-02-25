//
//  GraphEditor.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 8/27/23.
//

import SwiftData
import SwiftUI

enum GraphElement {
    case edges
    case vertices
}

struct GraphEditor: View {
    @Bindable var graph: Graph
    @State var graphElement: GraphElement = .edges
    @State private var showVertexBuilder: Bool = false
    @State private var showEdgeCreator: Bool = false
    @State private var showGraphSelector: Bool = false
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
                    EdgeList(graph: graph)
                case .vertices:
                    VertexList(graph: graph)
                }

                Spacer()
                    .toolbar {
                        #warning("Replace Editing")
//                        EditButton()

                        Button {
                            showGraphSelector = true
                        } label: {
                            Image(systemName: "folder")
                        }
                        .sheet(isPresented: $showGraphSelector) {
                            GraphSelector()
                        }
                        Button {
                            if graphElement == .vertices {
                                showVertexBuilder = true
                            } else if graphElement == .edges {
                                showEdgeCreator = true
                            }
                        } label: {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $showEdgeCreator) {
                            EdgeCreator(graph: graph)
                        }
                        .popoverTip(AddElementTip())
                        .alert("Add Vertex", isPresented: $showVertexBuilder) {
                            TextField("Add Vertex", text: $vertexName, prompt: Text("Vertex Name"))
                            Button ("Cancel", role: .cancel) {
                                showVertexBuilder = false
                                vertexName = ""
                            }
                            Button ("Add") {
                                graph.insert(vertexName)
                                vertexName = ""
                            }
                        }
                    }
            }
        }
        .navigationTitle("Graph Editor")
    }
}

#Preview("Edge List") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return GraphEditor(graph: connected_graph, graphElement: .edges)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Vertex List") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return GraphEditor(graph: connected_graph, graphElement: .vertices)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Empty Graph (Edge)") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return GraphEditor(graph: Graph(), graphElement: .edges)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Empty Graph (Vertices)") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return GraphEditor(graph: Graph(), graphElement: .vertices)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
