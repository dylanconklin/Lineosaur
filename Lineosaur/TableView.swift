//
//  TableView.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 8/9/23.
//

import SwiftData
import SwiftUI

/// Displays graph data as an adjacency table, using cells to display each data point
struct TableView: View {
    @Bindable var graph: Graph
    @State var showFacts: Bool = false

    var body: some View {
        if graph.edges.isEmpty {
            ContentUnavailableView("No edges in graph", systemImage: "hammer", description: Text("Go to the Edit tab to create an edge"))
        } else {
            ScrollView(.vertical, showsIndicators: true) {
                ScrollView(.horizontal, showsIndicators: true) {
                    Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                        GridRow {
                            Cell {
                                Spacer()
                            }
                            .toolbar {
                                Button("Graph Facts", systemImage: "info.circle", action: { showFacts = true })
                                .popoverTip(GraphFactsTip())
                                .sheet(isPresented: $showFacts) {
                                    GraphFacts(graph: graph)
                                }
                            }
                            ForEach(graph.vertices.sorted(), id: \.self) { x in
                                Cell {
                                    Text(String(x))
                                        .fontWeight(Font.Weight.bold)
                                }
                            }
                        }
                        ForEach(graph.vertices.sorted(), id: \.self) { y in
                            GridRow {
                                Cell {
                                    Text(String(y))
                                        .fontWeight(Font.Weight.bold)
                                }
                                ForEach(graph.vertices.sorted(), id: \.self) { x in
                                    var distance: String {
                                        var distance: String = ""
                                        distance = numToString(graph.edges(from: x, to: y, directional: false).sorted().first?.weight ?? 0.0)
                                        distance = y != x && distance == "0.0" ? "-" : distance
                                        return distance
                                    }
                                    Cell {
                                        Text(distance)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview("Empty Graph") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return TableView(graph: Graph())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty Graph") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return TableView(graph: connected_graph)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
