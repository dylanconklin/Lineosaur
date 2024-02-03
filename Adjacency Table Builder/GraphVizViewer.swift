//
//  GraphVizViewer.swift
//  Adjacency Table Builder
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
                Picker("Type of graph to display", selection: $graphType) {
                    Text("Given").tag(GraphType.given)
                    Text("MST").tag(GraphType.mst)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                Spacer()

                GraphViz(url: graphURL)

                Spacer()
                    .navigationTitle("View Table")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ShareLink(item: graphURL)
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
