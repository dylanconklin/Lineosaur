//
//  ContentView.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var input: String = """
    1 2 1.5
    1 3 2.5
    1 4 1.4
    1 5 1.3
    2 3 3.5
    2 4 2.4
    2 5 3.5
    3 2 2.3
    3 4 4.5
    3 5 2.5
    4 5 2.3
    """

    var G: Graph {
        var G: Graph = [:]
        let lines: [String] = input.components(separatedBy: .newlines)
        let edges: [[String]] = lines.map({ $0.components(separatedBy: " ") })
        edges.forEach({ edge in
            G[Set(arrayLiteral: edge[0], edge[1])] = Double(edge[2])
        })
        return G
    }

    var MST: Graph {
        kruskal(G: G)
    }

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                ScrollView(.horizontal, showsIndicators: true) {
                    Grid {
                        GridRow {
                            Cell(str: "")
                            ForEach(MST.vertices.sorted(), id: \.self) { x in
                                Cell(str: x)
                                    .fontWeight(Font.Weight.bold)
                            }
                        }
                        ForEach(MST.vertices.sorted(), id: \.self) { y in
                            GridRow {
                                Cell(str: y)
                                    .fontWeight(Font.Weight.bold)
                                ForEach(MST.vertices.sorted(), id: \.self) { x in
                                    var distance: String {
                                        var distance: String = ""
                                        distance = String(MST[Set(arrayLiteral: y, x)] ?? 0.0)
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
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
