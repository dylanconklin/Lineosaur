//
//  TableViewer.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 8/25/23.
//

import SwiftUI

/// Displays graph data as an adjacency table, using cells to display each data point
struct TableViewer: View {
    @ObservedObject var graph: GraphData

    var body: some View {
        TabView {
            TableView(G: graph.G)
                .tabItem {
                    VStack {
                        Image(systemName: "skew")
                        Text("View G")
                    }
                }
            TableView(G: graph.MST)
                .tabItem {
                    VStack {
                        Image(systemName: "skew")
                        Text("View MST")
                    }
                }
        }
    }
}

//struct TableViewer_Previews: PreviewProvider {
//    static let mst: Graph = [Set(["Baltimore", "Barre"]): 496,
//                             Set(["Baltimore", "Richmond"]): 149,
//                             Set(["Barre", "Richmond"]): 646,
//    ]
//    static var previews: some View {
//        TableViewer(graph: mst)
//    }
//}
