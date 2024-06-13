//
//  GraphFacts.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/11/23.
//

import SwiftData
import SwiftUI

struct GraphFact: View, Identifiable {
    var fact: String
    var symbol: String
    var value: Bool = .init(true)
    var id: UUID = .init()

    let fontSize: CGFloat = 32.0
    let imageSize: CGFloat = 48.0
    let minFrameSize: CGFloat = 48.0

    var body: some View {
        Grid {
            GridRow {
                ZStack {
                    Image(systemName: symbol)
                        .font(.system(size: fontSize))
                        .accessibilityLabel("Icon correlating to stated property")
                    if !value {
                        Image(systemName: "xmark")
                            .font(.system(size: imageSize))
                            .foregroundStyle(Color.red)
                            .accessibilityLabel("Indicates negation of stated property")
                    }
                }
                .frame(minHeight: minFrameSize)
                .padding(.horizontal)
                Text(fact)
                    .padding(.horizontal)
            }
        }
    }
}

struct GraphFacts: View {
    @Bindable var graph: Graph
    
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
            ),
            GraphFact(
                fact: "The graph is \(graph.isTrivial ? "" : "not ")trivial",
                symbol: "smallcircle.filled.circle",
                value: graph.isTrivial
            ),
            GraphFact(
                fact: "The graph is \(graph.isSimple ? "" : "not ")simple",
                symbol: "brain",
                value: graph.isSimple
            ),
            GraphFact(
                fact: "The graph is \(graph.isMulti ? "" : "not ")multi",
                symbol: "person.3",
                value: graph.isMulti
            ),
            GraphFact(
                fact: "The graph is \(graph.isComplete ? "" : "not ")complete",
                symbol: "gauge.with.dots.needle.100percent",
                value: graph.isComplete
            )
        ]
    }
    
    var body: some View {
        CloseButtonView(title: "Graph Facts", titleStyle: .inline) {
            List(graphFacts) { fact in
                fact
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
