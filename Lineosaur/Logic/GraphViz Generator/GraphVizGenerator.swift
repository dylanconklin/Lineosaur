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

    internal func generateGraphVizURL(of type: GraphType) -> URL? {
        var graph: Graph = self
        if type == .mst {
            graph = mst
        }

        // https:quickchart.io/graphviz?format=png&graph=graph{a--b}
        let directional: Bool = type == .given ? true : false
        var result: String = "https://quickchart.io/graphviz?"
        result.append("format=png&")
        result.append("layout=\(compiler)&")
        result.append("graph=\(directional ? "di" : "")graph")
        result.append("{")
        result.append("esep=50;")
        result.append("rankdir=TB;") // Can also be LR, RL, or BT
        result.append("sep=50;")
        for vertex in graph.vertices {
            result.append("\"\(vertex)\";")
        }
        for edge in graph.edges {
            let edgeStyle: EdgeStyle = type == .mst ?
                EdgeStyle(arrowhead: .plain, arrowtail: .plain) : graph.edgeStyles[edge.id, default: EdgeStyle()]

            // Set to and from
            result.append("\"\(edge.from)\"")
            result.append("\(directional ? "->" : "--")")
            result.append("\"\(edge.toward)\"")

            // Begin options
            result.append("[")

            // Display weight
            result.append("\(displayWeights ? "label=\(String(edge.weight))," : "")")

            // Arrows
            result.append("dir=both,")
            result.append("arrowhead=\(edgeStyle.arrowhead),")
            result.append("arrowtail=\(edgeStyle.arrowtail),")

            // End options
            result.append("];")
        }
        result.append("}")
        return URL(string: result)
    }
}
