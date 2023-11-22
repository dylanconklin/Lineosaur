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
        if graph.edges.isEmpty {
            VStack {
                Spacer()
                Text("No edges in graph")
                    .font(Comfortaa.body)
                    .multilineTextAlignment(.center)
                Text("Go to the Edges tab to create an edge")
                    .font(Comfortaa.body)
                    .multilineTextAlignment(.center)
                Spacer()
                GeometryReader { geo in
                    HStack {
                        Image(systemName: "arrow.down")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .frame(width: geo.size.width / 4)
                            .padding()
                        Spacer()
                    }
                }
                .frame(height: 35)
                .padding(.vertical)
            }
        } else {
            ScrollView(.vertical, showsIndicators: true) {
                ScrollView(.horizontal, showsIndicators: true) {
                    Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                        GridRow {
                            Cell {
                                Button {
                                    showFacts = true
                                } label: {
                                    Image(systemName: "info.circle.fill")
                                }
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

#Preview {
    @State var graph = Graph()
    return TableView(graph: graph)
}
