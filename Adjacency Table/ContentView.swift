//
//  ContentView.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetails: Bool = false
    
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
        let edges: [[String]] = lines.map({$0.components(separatedBy: " ")})
        edges.forEach({ edge in
            G[Set(arrayLiteral: edge[0], edge[1])] = Double(edge[2])
        })
        return G
    }
    
    var vertices: Set<Vertex> {
        var vertices: Set<Vertex> = []
        G.forEach { edge in
            vertices.formUnion(edge.key)
        }
        return vertices
    }
    
    var MST: Graph {
        kruskal(G: G, vertices: vertices)
    }
    
    var body: some View {
        VStack {
            // TextEditor(text: $input)
            Text(input)
            ScrollView (.vertical, showsIndicators: true) {
                ScrollView (.horizontal, showsIndicators: true) {
                    Grid {
                        GridRow {
                            Button ("x") {
                                showDetails = true
                            }
                            .padding()
                            .border(.black)
                            ForEach (vertices.sorted(), id: \.self) {x in
                                Button ("\(x)") {
                                    showDetails = true
                                }
                                .padding()
                                .border(.black)
                            }
                        }
                        ForEach (vertices.sorted(), id: \.self) {y in
                            GridRow {
                                Button ("\(y)") {
                                    showDetails = true
                                }
                                .padding()
                                .border(.black)
                                ForEach (vertices.sorted(), id: \.self) {x in
                                    let distance: Double = MST[Set(arrayLiteral: y, x)] ?? 0.0
                                    Button ("\(distance)") {
                                        showDetails = true
                                    }
                                    .padding()
                                    .border(.black)
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
