//
//  TableViewer.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 8/25/23.
//

import SwiftUI

enum GraphType {
    case mst
    case given
}

/// Displays graph data as an adjacency table, using cells to display each data point
struct TableViewer: View {
    @ObservedObject var graph: GraphData
    @State var graphType: GraphType = .given

    var body: some View {
        VStack {
            Picker("Type of graph to display", selection: $graphType) {
                Text("Given").tag(GraphType.given)
                Text("MST").tag(GraphType.mst)
            }
            .pickerStyle(.segmented)
            .padding()
            switch graphType {
            case .given:
                TableView(G: graph.G)
            case .mst:
                TableView(G: graph.G.mst)
            }
        }
    }
}

struct TableViewer_Previews: PreviewProvider {
    static let mst: Graph = [Edge(from: "Baltimore", to: "Barre", weight: 496),
                             Edge(from: "Baltimore", to: "Richmond", weight: 149),
                             Edge(from: "Barre", to: "Richmond", weight: 646),
    ]
    static var previews: some View {
        TableViewer(graph: GraphData())
    }
}
