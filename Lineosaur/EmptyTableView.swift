//
//  EmptyTableView.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 1/25/24.
//

import SwiftUI

struct EmptyTableView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("No edges in graph")
                .font(Comfortaa.body)
                .multilineTextAlignment(.center)
            Text("Go to the Edges tab to create an edge")
                .font(Comfortaa.body)
                .multilineTextAlignment(.center)
            Spacer()
            GeometryReader { geo in
                HStack {
                    Image(systemName: "arrow.down")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .frame(width: geo.size.width / 4)
                        .padding()
                    Spacer()
                }
            }
            .frame(height: 35)
            .padding(.vertical)
        }
    }
}

#Preview {
    EmptyTableView()
}
