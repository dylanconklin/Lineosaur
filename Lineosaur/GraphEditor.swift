//
//  GraphEditor.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 8/27/23.
//

import SwiftData
import SwiftUI
import TipKit

struct GraphEditor: View {
    @Bindable var graph: Graph
    @State private var showVertexBuilder: Bool = false
    @State private var showEdgeCreator: Bool = false
    @State private var vertexName: String = ""
    @State private var showTutorial = false
    @State private var showAddItem = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TipView(TutorialTip()) { _ in
                    showTutorial = true
                }
                .padding(.horizontal)
                
                if graph.edges.isEmpty && graph.vertices.isEmpty {
                    ContentUnavailableView("No edges or vertices to display", systemImage: "hammer", description: Text("Tap on + to add edges and vertices"))
                } else {
                    List {
                        EdgeList(graph: graph)
                        VertexList(graph: graph)
                    }
                }
                
                Spacer()
                    .sheet(isPresented: $showTutorial) {
                        Tutorial()
                    }
                    .toolbar {
                        ToolbarItemGroup(placement: .topBarLeading) {
                            Button("Help", systemImage: "questionmark.circle") {
                                showTutorial = true
                            }
                        }
                        
                        ToolbarItemGroup(placement: .topBarTrailing) {
                            EditButton()
                            
                            Button("Add", systemImage: "plus") {
                                showAddItem = true
                            }
                            .confirmationDialog("Add Elements", isPresented: $showAddItem) {
                                Button("Add Edge") { showEdgeCreator = true }
                                Button("Add Vertex") { showVertexBuilder = true }
                            }
                            .sheet(isPresented: $showEdgeCreator) {
                                EdgeCreator(graph: graph)
                            }
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
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview("Non-Empty Graph") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return GraphEditor(graph: connected_graph)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Empty Graph") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return GraphEditor(graph: Graph())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
