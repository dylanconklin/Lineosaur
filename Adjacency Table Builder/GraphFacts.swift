//
//  GraphFacts.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 9/11/23.
//

import SwiftUI

struct GraphFact: View {
    var fact: String
    var symbol: String

    var body: some View {
        VStack {
            Spacer()
            Image(systemName: symbol)
                .font(.system(size: 64))
            Spacer()
            Text(fact)
            Spacer()
        }
    }
}

struct GraphFacts: View {
    var graph: Graph

    var body: some View {
        TabView {
            GraphFact(fact: "The cost is \(graph.cost)",
                      symbol: "clock")
                .tabItem {}
            GraphFact(fact: "The graph is \(graph.isCyclic ? "" : "a")cyclic",
                      symbol: graph.isCyclic ? "arrow.triangle.2.circlepath" : "exclamationmark.arrow.triangle.2.circlepath")
                .tabItem {}
            GraphFact(fact: "The graph has \(graph.vertices.count) \(graph.vertices.count == 1 ? "vertex" : "vertices")",
                      symbol: "smallcircle.circle")
                .tabItem {}
            GraphFact(fact: "The graph has \(graph.edges.count) edge\(graph.edges.count == 1 ? "" : "s")",
                      symbol: "point.topleft.down.curvedto.point.bottomright.up")
                .tabItem {}
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    GraphFacts(graph: Graph())
}
