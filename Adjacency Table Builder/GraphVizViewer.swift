//
//  GraphVizViewer.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 9/29/23.
//

import SwiftUI

struct GraphVizViewer: View {
    var graph: Graph
    @State var graphType: GraphType = .given

    var body: some View {
        VStack {
            Picker("Type of graph to display", selection: $graphType) {
                Text("Given").tag(GraphType.given)
                Text("MST").tag(GraphType.mst)
            }
            .pickerStyle(.segmented)
            .padding()
            Spacer()
            switch graphType {
            case .given:
                GraphViz(graph: graph, directional: true)
            case .mst:
                GraphViz(graph: graph.mst, directional: false)
            }
            Spacer()
        }
    }
}

#Preview {
    GraphVizViewer(graph: Graph())
}
