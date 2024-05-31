//
//  GraphEditor.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 8/27/23.
//

import SwiftData
import SwiftUI
import TipKit

internal struct GraphEditor: View {
    @Bindable internal var graph: Graph
    @State private var showVertexBuilder: Bool = .init(false)
    @State private var showEdgeCreator: Bool = .init(false)
    @State private var vertexName: String = ""
    @State private var showTutorial: Bool = .init(false)
    @State private var showGraphSelector: Bool = .init(false)

    internal var body: some View {
        NavigationStack {
            VStack {
                if graph.isEmpty {
                    emptyView
                } else {
                    graphData
                }
                toolbar
            }
            .navigationTitle("Graph Editor")
        }
    }

    private var graphSelectorButton: some View {
        Button("Open Graph", systemImage: "folder") {
            showGraphSelector = true
        }
    }

    private var addButton: some View {
        Menu("Add", systemImage: "plus") {
            Button("Add Edge", systemImage: "app.connected.to.app.below.fill") { showEdgeCreator = true }
            Button("Add Vertex", systemImage: "smallcircle.filled.circle") { showVertexBuilder = true }
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

    private var menu: some View {
        Menu("Menu", systemImage: "ellipsis.circle") {
            Button("Help", systemImage: "questionmark.circle") { showTutorial = true }
            graphSelectorButton
            Menu("Delete Edges", systemImage: "app.connected.to.app.below.fill") {
                Button("Smallest Edges", systemImage: "trash", role: .destructive) {
                    if let edge: Edge = graph.edges.min() {
                        graph.remove(edge)
                    }
                }
                Button("Largest Edges", systemImage: "trash", role: .destructive) {
                    if let edge: Edge = graph.edges.max() {
                        graph.remove(edge)
                    }
                }
                Button("All Edges", systemImage: "trash", role: .destructive) { graph.deleteEdges() }
            }
            Menu("Delete Vertices", systemImage: "smallcircle.filled.circle") {
                Button("Detached Vertices", systemImage: "trash", role: .destructive) {
                    graph.deleteDetachedVertices()
                }
                Button("Leaves", systemImage: "trash", role: .destructive) { graph.deleteLeaves() }
            }
            Button("Delete Graph", systemImage: "trash", role: .destructive) {
                graph.deleteEdgesAndVertices()
            }
        }
        .onAppear {
            assert(!graph.isEmpty)
        }
        .popoverTip(HelpTip())
    }

    private var graphData: some View {
        List {
            if !graph.edges.isEmpty {
                EdgeList(graph: graph)
            }
            if !graph.vertices.isEmpty {
                VertexList(graph: graph)
            }
        }
        .navigationDestination(for: Edge.self) { _ in Spacer() }
        .listStyle(.sidebar)
    }

    private var toolbar: some View {
        Spacer()
            .sheet(isPresented: $showGraphSelector) {
                GraphSelector()
            }
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
                        if graph.isEmpty {
                            graphSelectorButton
                        }
                        addButton
                    }
                }
            }
    }

    private var emptyView: some View {
        VStack {
            TipView(TutorialTip()) { _ in
                showTutorial = true
            }
            .padding(.horizontal)
            ContentUnavailableView(
                "No edges or vertices to display",
                systemImage: "hammer",
                description: Text("Tap on + to add data")
            )
        }
    }
}

#Preview("Non-Empty Graph") {
    do {
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return GraphEditor(graph: connectedGraph)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Empty Graph") {
    do {
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return GraphEditor(graph: Graph())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
