//
//  GraphViz Generator.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 10/1/23.
//

import Foundation

extension Graph {

    fileprivate var compiler: Compiler {
        let compiler = UserDefaults.standard.string(forKey: "compiler")
        return compiler.flatMap(Compiler.init) ?? .dot
    }

    fileprivate var displayWeights: Bool {
        UserDefaults.standard.bool(forKey: "displayEdgeWeights")
    }

    func generateGraphVizURL(of type: GraphType) -> URL {
        var graph = self
        if type == .mst {
            graph = self.mst
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
        graph.vertices.forEach { vertex in
            result.append("\"\(vertex)\";")
        }
        graph.edges.forEach { edge in
            let edgeStyle: EdgeStyle = type == .mst ? EdgeStyle(arrowhead: .none, arrowtail: .none) : graph.edgeStyles[edge.id, default: EdgeStyle()]

            // Set to and from
            result.append("\"\(edge.from)\"")
            result.append("\(directional ? "->" : "--")")
            result.append("\"\(edge.to)\"")

            // Begin options
            result.append("[")

            // Display weight
            result.append("\(displayWeights ? "label=\(numToString(edge.weight))," : "")")

            // Arrows
            result.append("dir=both,")
            result.append("arrowhead=\(edgeStyle.arrowhead),")
            result.append("arrowtail=\(edgeStyle.arrowtail),")

            // End options
            result.append("];")
        }
        result.append("}")
        return URL(string: result)!
    }
}
