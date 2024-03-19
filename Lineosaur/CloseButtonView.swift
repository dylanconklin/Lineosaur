//
//  CloseButtonView.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 3/18/24.
//

import SwiftUI

struct CloseButtonView<Content: View>: View {
    @Environment(\.dismiss) var dismiss
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding()
            }
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .topTrailing)
            content()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

#Preview {
    CloseButtonView() {
        Spacer()
    }
}
