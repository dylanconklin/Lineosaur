//
//  InputView.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/23/23.
//

import SwiftUI

struct InputView: View {
    @State private var input: String = ""
    var body: some View {
        ZStack {
            TextEditor(text: $input)
        }
        .padding()
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
