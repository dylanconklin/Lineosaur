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
        result.append("sep=50;")
        result.append("esep=50;")
        graph.vertices.forEach { vertex in
            result.append("\(vertex);")
        }
        graph.edges.forEach { edge in
            result.append("\(edge.from)")
            result.append("\(directional ? "->" : "--")")
            result.append("\(edge.to)")
            if displayWeights {
                result.append("[\(displayWeights ? "label=\(numToString(edge.weight))" : "")]")
            }
            result.append(";")
        }
        result.append("}")
        return URL(string: result)!
    }
}
