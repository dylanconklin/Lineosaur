//
//  GraphFacts.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/11/23.
//

import SwiftData
import SwiftUI

internal struct GraphFact: View, Identifiable {
    internal var fact: String
    internal var symbol: String
    internal var value: Bool = true
    internal var id: UUID = UUID()

    internal var body: some View {
        Grid {
            GridRow {
                ZStack {
                    Image(systemName: symbol)
                        .font(.system(size: 32))
                        .accessibilityLabel("Icon correlating to stated property")
                    if !value {
                        Image(systemName: "xmark")
                            .font(.system(size: 48))
                            .foregroundStyle(Color.red)
                            .accessibilityLabel("Indicates negation of stated property")
                    }
                }
                .frame(minHeight: 48)
                .padding(.horizontal)
                Text(fact)
                    .padding(.horizontal)
            }
        }
    }
}

internal struct GraphFacts: View {
    @Bindable internal var graph: Graph

    private var graphFacts: [GraphFact] {
        [
            GraphFact(
                fact: "The graph has \(graph.edges.count) "
                + "edge\(graph.edges.count == 1 ? "" : "s") and \(graph.vertices.count) "
                + "\(graph.vertices.count == 1 ? "vertex" : "vertices")",
                symbol: "point.topleft.down.curvedto.point.bottomright.up"
            ),
            GraphFact(
                fact: "The cost is \(graph.cost)",
                symbol: "clock"
            ),
            GraphFact(
                fact: "The graph is \(graph.isCyclic ? "" : "a")cyclic",
                symbol: "arrow.triangle.2.circlepath",
                value: graph.isCyclic
            ),
            GraphFact(
                fact: "The graph is \(graph.isConnected ? "" : "not ")connected",
                symbol: "point.3.connected.trianglepath.dotted",
                value: graph.isConnected
            ),
            GraphFact(
                fact: "The graph is \(graph.isTree ? "" : "not ")a tree",
                symbol: "tree",
                value: graph.isTree
            ),
            GraphFact(
                fact: "The graph is \(graph.isBipartite ? "" : "not ")bipartite",
                symbol: "rectangle.split.2x1",
                value: graph.isBipartite
            )
        ]
    }

    internal var body: some View {
        CloseButtonView(title: "Graph Facts", titleStyle: .inline) {
            List {
                ForEach(graphFacts) { fact in
                    fact
                }
            }
        }
    }
}

#Preview("Empty Graph") {
    do {
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return GraphFacts(graph: Graph())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty Graph") {
    do {
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return GraphFacts(graph: connectedGraph)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
