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

    var body: some View {
        if graph.edges.isEmpty {
            ContentUnavailableView("No edges in graph",
                                   systemImage: "hammer",
                                   description: Text("Go to the Edit tab to create an edge"))
        } else {
            ScrollView([.horizontal, .vertical], showsIndicators: true) {
                Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                    GridRow {
                        Cell {
                            Spacer()
                        }
                        ForEach(graph.vertices.sorted(), id: \.self) { vertex in
                            Cell {
                                Text(String(vertex))
                                    .fontWeight(Font.Weight.bold)
                            }
                        }
                    }
                    ForEach(graph.vertices.sorted(), id: \.self) { vertex1 in
                        GridRow {
                            Cell {
                                Text(String(vertex1))
                                    .fontWeight(Font.Weight.bold)
                            }
                            ForEach(graph.vertices.sorted(), id: \.self) { vertex2 in
                                var distance: String {
                                    var distance = ""
                                    distance = String(graph.edges(from: vertex2,
                                                                  to: vertex1,
                                                                  directional: false)
                                            .sorted()
                                            .first?.weight ?? 0.0)
                                    distance = vertex1 != vertex2 && distance == "0.0" ? "-" : distance
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
        return TableView(graph: connectedGraph)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
