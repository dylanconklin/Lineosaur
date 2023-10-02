//
//  GraphViz.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 9/29/23.
//

import SwiftUI

import WebKit

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
    var src: String { graph.generateGraphViz(directional: directional) }
    var url: URL { URL(string: src)! }
    var webView: WKWebView!

    var body: some View {
        WebView(url: url)
    }
}

#Preview {
    GraphViz(graph: Graph(), directional: false)
}
