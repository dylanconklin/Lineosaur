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

    @AppStorage("showEdges") private var showEdges: Bool = true
    @AppStorage("showVertices") private var showVertices: Bool = true

    var body: some View {
        NavigationStack {
            VStack {
                TipView(TutorialTip()) { _ in
                    showTutorial = true
                }
                .padding(.horizontal)

                if graph.isEmpty {
                    ContentUnavailableView("No edges or vertices to display", systemImage: "hammer", description: Text("Tap on + to add data"))
                } else if !(showEdges || showVertices) {
                    ContentUnavailableView {
                        Label("Edges and vertices hidden", systemImage: "eye.slash")
                    } actions: {
                        Button("Show") {
                            showEdges = true
                            showVertices = true
                        }
                    }
                } else {
                    List {
                        if showEdges && !graph.edges.isEmpty {
                            Section("Edges") {
                                EdgeList(graph: graph)
                            }
                        }
                        if showVertices && !graph.vertices.isEmpty {
                            Section("Vertices") {
                                VertexList(graph: graph)
                            }
                        }
                    }
                }

                Spacer()
                    .sheet(isPresented: $showTutorial) {
                        Tutorial()
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            if !graph.isEmpty {
                                EditButton()
                            } else {
                                Button("Help", systemImage: "questionmark.circle") { showTutorial = true }
                            }
                        }

                        ToolbarItem(placement: .topBarTrailing) {
                            HStack {
                                if !graph.isEmpty {
                                    menu
                                }
                                addButton
                            }
                        }
                    }
            }
            .navigationTitle("Graph Editor")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    var addButton: some View {
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
            Button("Cancel", role: .cancel) {
                showVertexBuilder = false
                vertexName = ""
            }
            Button("Add") {
                graph.insert(vertexName)
                vertexName = ""
            }
        }
    }

    var menu: some View {
        Menu {
            Menu("Show") {
                Button("Edges", systemImage: "\(showEdges ? "checkmark" : "")") {
                    showEdges.toggle()
                }
                Button("Vertices", systemImage: "\(showVertices ? "checkmark" : "")") {
                    showVertices.toggle()
                }
            }
            Menu("Delete Edges") {
                Button("All Edges", systemImage: "trash", role: .destructive) {
                    graph.deleteEdges()
                }
                Button("Largest Edges", systemImage: "trash", role: .destructive) {
                    graph.remove(graph.edges.sorted(by: <).first!)
                }
                Button("Edges and Vertices", systemImage: "trash", role: .destructive) {
                    graph.deleteEdgesAndVertices()
                }
            }
            Menu("Delete Vertices") {
                Button("Detached Vertices", systemImage: "trash", role: .destructive) {
                    graph.deleteDetachedVertices()
                }
                Button("Leaves", systemImage: "trash", role: .destructive) {
                    graph.deleteLeaves()
                }
                Button("Edges and Vertices", systemImage: "trash", role: .destructive) {
                    graph.deleteEdgesAndVertices()
                }
            }
            Button("Help", systemImage: "questionmark.circle") {
                showTutorial = true
            }
        } label: {
            Label("Menu", systemImage: "ellipsis.circle")
        }
        .onAppear {
            assert(!graph.isEmpty)
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
