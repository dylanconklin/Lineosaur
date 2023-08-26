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
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ScrollView(.horizontal, showsIndicators: true) {
                Grid {
                    GridRow {
                        Cell(str: "")
                        ForEach(G.vertices.sorted(), id: \.self) { x in
                            Cell(str: x)
                                .fontWeight(Font.Weight.bold)
                        }
                    }
                    ForEach(G.vertices.sorted(), id: \.self) { y in
                        GridRow {
                            Cell(str: y)
                                .fontWeight(Font.Weight.bold)
                            ForEach(G.vertices.sorted(), id: \.self) { x in
                                var distance: String {
                                    var distance: String = ""
                                    distance = String(G[Set(arrayLiteral: y, x)] ?? 0.0)
                                    distance = y != x && distance == "0.0" ? "-" : distance
                                    return distance
                                }
                                Cell(str: distance)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static let mst: Graph = [Set(["Baltimore", "Barre"]): 496,
                             Set(["Baltimore", "Richmond"]): 149,
                             Set(["Barre", "Richmond"]): 646,
    ]
    static var previews: some View {
        TableView(G: mst)
    }
}
