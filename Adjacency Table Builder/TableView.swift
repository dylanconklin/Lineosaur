//
//  TableView.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 8/9/23.
//

import SwiftUI

/// Displays graph data as an adjacency table, using cells to display each data point
struct TableView: View {
    var G: Graph
    @State var showFacts: Bool = false
    
    var body: some View {
        if G.isEmpty{
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
                                    GraphFacts(graph: G)
                                }
                            }
                            ForEach(G.vertices.sorted(), id: \.self) { x in
                                Cell {
                                    Text(String(x))
                                        .fontWeight(Font.Weight.bold)
                                }
                            }
                        }
                        ForEach(G.vertices.sorted(), id: \.self) { y in
                            GridRow {
                                Cell {
                                    Text(String(y))
                                        .fontWeight(Font.Weight.bold)
                                }
                                ForEach(G.vertices.sorted(), id: \.self) { x in
                                    var distance: String {
                                        var distance: String = ""
                                        distance = String(G.edges(from: x, to: y, directional: false).sorted().first?.weight ?? 0.0)
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

struct TableView_Previews: PreviewProvider {
    static let mst: Graph = [Edge(from: "Baltimore", to: "Barre", weight: 496),
                             Edge(from: "Baltimore", to: "Richmond", weight: 149),
                             Edge(from: "Barre", to: "Richmond", weight: 646),
    ]
    static var previews: some View {
        TableView(G: mst)
    }
}
