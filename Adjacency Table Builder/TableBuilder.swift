//
//  TableBuilder.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 8/4/23.
//

import SwiftData
import SwiftUI

struct TableBuilder: View {
    @Bindable var g: G

    var body: some View {
        List {
            ForEach($g.G.edgesArray, id: \.self, editActions: .delete) { edge in
                EdgeBuilder(from: edge.verticesArray[0], to: edge.verticesArray[1], weight: edge.weight)
            }
            Button {
            } label: {
                HStack {
                    Spacer()
                    Image(systemName: "plus")
                    Spacer()
                }
            }
        }
    }
}

struct TableBuilder_Previews: PreviewProvider {
    static var g = G()
    static var previews: some View {
        TableBuilder(g: g)
    }
}
