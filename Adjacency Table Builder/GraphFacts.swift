//
//  GraphFacts.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 9/11/23.
//

import SwiftData
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
    @Bindable var graph: Graph

    var body: some View {
        TabView {
            GraphFact(fact: "The graph has \(graph.edges.count) edge\(graph.edges.count == 1 ? "" : "s") and \(graph.vertices.count) \(graph.vertices.count == 1 ? "vertex" : "vertices")",
                      symbol: "point.topleft.down.curvedto.point.bottomright.up")
                .tabItem {}
            GraphFact(fact: "The cost is \(graph.cost)",
                      symbol: "clock")
                .tabItem {}
            GraphFact(fact: "The graph is \(graph.isCyclic ? "" : "a")cyclic",
                      symbol: graph.isCyclic ? "arrow.triangle.2.circlepath" : "exclamationmark.arrow.triangle.2.circlepath")
                .tabItem {}
            GraphFact(fact: "The graph is \(graph.isConnected ? "" : "not ")connected",
                      symbol: "point.3.connected.trianglepath.dotted")
                .tabItem {}
            GraphFact(fact: "The graph is \(graph.isTree ? "" : "not ")a tree",
                      symbol: "tree")
                .tabItem {}
            GraphFact(fact: "The graph is \(graph.isBipartite ? "" : "not ")bipartite",
                      symbol: graph.isBipartite ? "rectangle.split.2x1" : "rectangle.split.2x1.slash")
                .tabItem {}
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview("Empty Graph") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return GraphFacts(graph: Graph())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty Graph") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return GraphFacts(graph: connected_graph)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
