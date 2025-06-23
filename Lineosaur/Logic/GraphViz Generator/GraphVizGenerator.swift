// swiftlint:disable:this file_name
//
//  GraphViz Generator.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 10/1/23.
//

import Foundation

extension Graph {
    private var compiler: Compiler {
        let compiler: String? = UserDefaults.standard.string(forKey: "compiler")
        return compiler.flatMap(Compiler.init) ?? .dot
    }

    private var displayWeights: Bool {
        UserDefaults.standard.bool(forKey: "displayEdgeWeights")
    }

    func generateGraphVizURL(of type: GraphType) -> URL? {
        var graph: Graph = self
        if type == .mst {
            graph = mst
        }

        // https:quickchart.io/graphviz?format=png&graph=graph{a--b}
        let directional: Bool = type == .given
        return URL(
            string: [
                "https://quickchart.io/graphviz?",
                "format=png&",
                "layout=\(compiler)&",
                "graph=\(directional ? "di" : "")graph",
                "{",
                "esep=50;",
                "rankdir=TB;", // Can also be LR, RL, or BT
                "sep=50;",
                graph.vertices.map { vertex in "\"\(vertex)\";" }.joined(),
                graph.edges.map { edge in
                    let edgeStyle: EdgeStyle = type == .mst ?
                        EdgeStyle(arrowhead: .plain, arrowtail: .plain) :
                        graph.edgeStyles[edge.id, default: EdgeStyle()]

                    return [
                        // Set to and from
                        [
                            "\"\(edge.from)\"",
                            "\(directional ? "->" : "--")",
                            "\"\(edge.toward)\""
                        ].joined(),

                        // Begin options
                        "[",

                        // Display weight
                        "\(displayWeights ? "label=\(String(edge.weight))," : "")",

                        // Arrows
                        [
                            "dir=both,",
                            "arrowhead=\(edgeStyle.arrowhead),",
                            "arrowtail=\(edgeStyle.arrowtail),"
                        ].joined(),

                        // End options
                        "];"
                    ].joined()
                }
                .joined(),
                "}"
            ].joined()
        )
    }
}
