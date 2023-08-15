//
//  TableView.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 8/9/23.
//

import SwiftUI

struct TableView: View {
    var MST: Graph
    
    var body: some View {
        VStack {
            if MST.isEmpty {
                Text("No table to view")
                Text("Go to the table builder to create a table")
            } else {
                ScrollView(.vertical, showsIndicators: true) {
                    ScrollView(.horizontal, showsIndicators: true) {
                        Grid {
                            GridRow {
                                Cell(str: "")
                                ForEach(MST.vertices.sorted(), id: \.self) { x in
                                    Cell(str: x)
                                        .fontWeight(Font.Weight.bold)
                                }
                            }
                            ForEach(MST.vertices.sorted(), id: \.self) { y in
                                GridRow {
                                    Cell(str: y)
                                        .fontWeight(Font.Weight.bold)
                                    ForEach(MST.vertices.sorted(), id: \.self) { x in
                                        var distance: String {
                                            var distance: String = ""
                                            distance = String(MST[Set(arrayLiteral: y, x)] ?? 0.0)
                                            distance = y != x && distance == "0.0" ? "-" : distance
                                            return distance
                                        }
                                        Cell(str: distance)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct TableView_Previews: PreviewProvider {
    static let mst: Graph = [:]
    static var previews: some View {
        TableView(MST: mst)
    }
}
