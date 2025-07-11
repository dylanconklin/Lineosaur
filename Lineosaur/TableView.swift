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
    @Binding var graphType: GraphType

    var body: some View {
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

    private var table: some View {
        Grid(horizontalSpacing: 0, verticalSpacing: 0) {
            tableTopRow
            tableBody
        }
        .padding()
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
                        graph.edges(from: vertex1, toward: vertex2).isEmpty ?
                            "-" :
                            String(
                                graph.edges(
                                    from: vertex1,
                                    toward: vertex2,
                                    directional: graphType == .given
                                )
                                .min()?.weight ?? .infinity
                            )
                    }
                    Cell {
                        Text(distance)
                    }
                }
            }
        }
    }
}

#Preview("Empty Graph") {
    @Previewable @State var graphType: GraphType = .given
    do {
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return TableView(graph: Graph(), graphType: $graphType)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty Graph") {
    @Previewable @State var graphType: GraphType = .given
    do {
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return TableView(graph: graph2, graphType: $graphType)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
