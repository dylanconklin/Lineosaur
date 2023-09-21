//
//  TableView.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 8/9/23.
//

import SwiftUI

/// Displays graph data as an adjacency table, using cells to display each data point
struct TableView: View {
    var graph: Graph
    @State var showFacts: Bool = false
    
    var body: some View {
        if graph.edges.isEmpty{
            VStack {
                Text("No table to view")
                Text("Go to the table builder to create a table")
            }
        } else {
            ScrollView(.vertical, showsIndicators: true) {
                ScrollView(.horizontal, showsIndicators: true) {
                    Grid (horizontalSpacing: 0, verticalSpacing: 0) {
                        GridRow {
                            Cell {
                                Button {
                                    showFacts = true
                                } label: {
                                    Image(systemName: "info.circle.fill")
                                }
                                .sheet(isPresented: $showFacts){
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
                                        distance = String(graph.edges(from: x, to: y, directional: false).sorted().first?.weight ?? 0.0)
                                        distance = y != x && distance == "0.0" ? "-" : distance
                                        return distance
                                    }
                                    Cell {
                                        Text(String(distance))
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

#Preview {
    @State var graph = Graph()
    return TableView(graph: graph)
}
