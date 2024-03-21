//
//  GraphVizViewer.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/29/23.
//

import SwiftData
import SwiftUI

struct GraphVizViewer: View {
    @Bindable var graph: Graph

    @State private var graphType: GraphType = .given

    private var directional: Bool {
        if graphType == .given { return true }
        else if graphType == .mst { return false }
        else { return false }
    }

    private var graphURL: URL { graph.generateGraphVizURL(of: graphType) }

    var body: some View {
        NavigationStack {
            VStack {
                if graph.isEmpty {
                    ContentUnavailableView("No graph to display", systemImage: "hammer", description: Text("Go to the Edit tab to add edges and vertices"))
                } else if graphType == .mst && graph.mst == nil {
                    ContentUnavailableView("No graph to display", systemImage: "exclamationmark.triangle", description: Text("Graph is not a tree"))
                } else {
                    GraphViz(url: graphURL)
                }

                Spacer()
                    .navigationTitle("View Table")
                    .toolbar {
                        if !graph.isEmpty {
                            ToolbarItem(placement: .topBarTrailing) {
                                Menu {
                                    Menu {
                                        Picker("Graph Type", selection: $graphType) {
                                            Text("Given").tag(GraphType.given)
                                            Text("MST").tag(GraphType.mst)
                                        }
                                    } label: {
                                        Label("Graph Type", systemImage: "square.on.circle")
                                    }
                                    ShareLink("Share", item: graphURL)
                                } label: {
                                    Label("Menu", systemImage: "ellipsis.circle")
                                }
                            }
                        }
                    }
            }
        }
    }
}


#Preview("Empty Graph") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return GraphVizViewer(graph: Graph())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty Graph") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return GraphVizViewer(graph: connected_graph)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
