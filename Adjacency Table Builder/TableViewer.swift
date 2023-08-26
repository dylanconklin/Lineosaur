//
//  TableViewer.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 8/25/23.
//

import SwiftUI

/// Displays graph data as an adjacency table, using cells to display each data point
struct TableViewer: View {
    var G: Graph
    @State var showDetails: Bool = false

    var body: some View {
        ZStack {
            VStack {
                if G.isEmpty {
                    Text("No table to view")
                    Text("Go to the table builder to create a table")
                } else {
                    TableView(G: G)
                }
            }
            .padding()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showDetails = true
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .padding()
                            .padding()
                    }
                }
            }
            .alert("Graph Details", isPresented: $showDetails){
                Button ("Okay") {
                    showDetails = false
                }
            } message: {
                VStack {
                    Text("Cost is \(String(G.cost))\n\(G.vertices.count) vertices\n\(G.edges.count) edges")
                }
            }
        }
    }
}

struct TableViewer_Previews: PreviewProvider {
    static let mst: Graph = [Set(["Baltimore", "Barre"]): 496,
                             Set(["Baltimore", "Richmond"]): 149,
                             Set(["Barre", "Richmond"]): 646,
    ]
    static var previews: some View {
        TableViewer(G: mst)
    }
}
