//
//  TableView.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 8/9/23.
//

import SwiftData
import SwiftUI

/// Displays graph data as an adjacency table, using cells to display each data point
internal struct TableView: View {
    @Bindable internal var graph: Graph

    internal var body: some View {
        if graph.edges.isEmpty {
            ContentUnavailableView(
                "No edges in graph",
                systemImage: "hammer",
                description: Text("Go to the Edit tab to create an edge")
            )
        } else {
            ScrollView([.horizontal, .vertical], showsIndicators: true) {
                table
            }
        }
    }

    private var tableTopRow: some View {
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
    }

    private var tableBody: some View {
        ForEach(graph.vertices.sorted(), id: \.self) { vertex1 in
            GridRow {
                Cell {
                    Text(String(vertex1))
                        .fontWeight(Font.Weight.bold)
                }
                ForEach(graph.vertices.sorted(), id: \.self) { vertex2 in
                    var distance: String {
                        var distance: String = ""
                        distance = String(
                            graph.edges(
                                from: vertex2,
                                toward: vertex1,
                                directional: false
                            )
                            .sorted()
                            .first?.weight ?? 0.0
                        )
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

    private var table: some View {
        Grid(horizontalSpacing: 0, verticalSpacing: 0) {
            tableTopRow
            tableBody
        }
        .padding()
    }
}

#Preview("Empty Graph") {
    do {
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return TableView(graph: Graph())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty Graph") {
    do {
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return TableView(graph: connectedGraph)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
