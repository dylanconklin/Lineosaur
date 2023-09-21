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
                TableView(graph: graph)
            case .mst:
                TableView(graph: graph.mst)
            }
            Spacer()
        }
    }
}

#Preview {
    TableViewer(graph: Graph())
}
