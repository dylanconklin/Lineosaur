//
//  GraphViz Generator.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 10/1/23.
//

import Foundation

extension Graph {
    func generateGraphViz(directional: Bool) -> String {
        // https:quickchart.io/graphviz?format=png&graph=graph{a--b}
        var result: String = "https://quickchart.io/graphviz?layout=dot&graph="
        result.append("\(directional ? "di" : "")graph")
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
            result.append("[label=\(edge.weight)]")
            result.append(";")
        }
        result.append("}")
        print(result)
        return result
    }
}
