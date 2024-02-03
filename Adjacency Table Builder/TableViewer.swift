//
//  TableViewer.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 8/25/23.
//

import SwiftData
import SwiftUI

/// Displays graph data as an adjacency table, using cells to display each data point
struct TableViewer: View {
    @Bindable var graph: Graph
    @State var graphType: GraphType = .given

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
                switch graphType {
                    case .given:
                        TableView(graph: graph)
                    case .mst:
                        TableView(graph: graph.mst)
                }
                Spacer()
            }
            .navigationTitle("Adjacency Table")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview("Empty Graph") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return TableViewer(graph: Graph())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty Graph") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return TableViewer(graph: connected_graph)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
