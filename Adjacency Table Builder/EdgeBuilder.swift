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
                    Text("from   : \(from)")
                    Spacer()
                }
                HStack {
                    Text("to     : \(to)")
                    Spacer()
                }
                HStack {
                    Text("weight : \(weight == weight.rounded() ? String(Int(weight)) : String(weight))")
                    Spacer()
                }
            }
        }
        .monospaced()
        .padding()
    }
}

struct EdgeBuilder_Previews: PreviewProvider {
    @State static var x = "Destination"
    @State static var y = 5.0
    @State static var z = 5.5
    static var previews: some View {
        VStack {
            EdgeBuilder(from: $x, to: $x, weight: $y)
            EdgeBuilder(from: $x, to: $x, weight: $z)
        }
    }
}
