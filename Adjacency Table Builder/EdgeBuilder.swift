//
//  EdgeBuilder.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 8/1/23.
//

import SwiftUI

struct EdgeBuilder: View {
    @Binding var from: String
    @Binding var to: String
    @Binding var weight: Double

    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("from   : ")
                    TextField("from", text: $from)
                    Spacer()
                }
                HStack {
                    Text("to     : ")
                    TextField("to", text: $to)
                    Spacer()
                }
                HStack {
                    Text("weight : ")
                    TextField("weight",
                              text: Binding(
                                  get: { String(weight) },
                                  set: { weight = Double($0) ?? 0.0 }))
                    Spacer()
                }
            }
            .fontDesign(Font.Design.monospaced)
        }
        .padding()
    }
}

struct EdgeBuilder_Previews: PreviewProvider {
    @State static var x = "Destination"
    @State static var y = 5.0
    static var previews: some View {
        EdgeBuilder(from: $x, to: $x, weight: $y)
    }
}
