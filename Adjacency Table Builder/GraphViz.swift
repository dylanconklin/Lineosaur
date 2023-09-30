//
//  GraphViz.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 9/29/23.
//

import SwiftUI

import WebKit

func generateGraph(graph: Graph, directional: Bool) -> String {
    // https:quickchart.io/graphviz?format=png&graph=graph{a--b}
    var result: String = "https://quickchart.io/graphviz?layout=neato&format=png&graph="
    result.append("\(directional ? "di" : "")graph")
    result.append("{")
    graph.vertices.forEach { vertex in
        result.append("\(vertex);")
    }
    graph.edges.forEach { edge in
        result.append("\(edge.from)")
        result.append("\(directional ? "->" : "--")")
        result.append("\(edge.to);")
    }
    result.append("}")
    print(result)
    return result
}

struct WebView : UIViewRepresentable {
    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView(frame: .zero)
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct GraphViz: View {
    var graph: Graph
    var directional: Bool
    var src: String { generateGraph(graph: graph, directional: directional) }
    var url: URL { URL(string: src)! }
    var webView: WKWebView!

    var body: some View {
        WebView(url: url)
    }
}

#Preview {
    GraphViz(graph: Graph(), directional: false)
}
