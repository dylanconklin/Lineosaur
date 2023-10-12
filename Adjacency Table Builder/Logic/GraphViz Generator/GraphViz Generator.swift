//
//  GraphViz Generator.swift
//  Adjacency Table Builder
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
        UserDefaults.standard.bool(forKey: "displayWeights")
    }

    func generateGraphViz(directional: Bool) -> String {
        // https:quickchart.io/graphviz?format=png&graph=graph{a--b}
        var result: String = "https://quickchart.io/graphviz?"
        result.append("layout=\(compiler)&")
        result.append("graph=\(directional ? "di" : "")graph")
        result.append("{")
        result.append("sep=50;")
        result.append("esep=50;")
        vertices.forEach { vertex in
            result.append("\(vertex);")
        }
        edges.forEach { edge in
            result.append("\(edge.from)")
            result.append("\(directional ? "->" : "--")")
            result.append("\(edge.to)")
            result.append("[\(displayWeights ? "label=\(numToString(edge.weight))" : "")]")
            result.append(";")
        }
        result.append("}")
        return result
    }
}
