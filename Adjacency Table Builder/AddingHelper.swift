//
//  AddingHelper.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 9/22/23.
//

import SwiftUI

struct AddingHelper: View {
    var helpText: String
    @State var scale: Double = 1.0

    var body: some View {
        ZStack {
            Text("\(helpText)")
                .font(Comfortaa.body)
                .frame(alignment: .center)
                .multilineTextAlignment(.center)
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "arrow.up")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .rotationEffect(.init(degrees: 30))
                        .padding(.horizontal, 70.0)
                        .scaleEffect(scale)
                        .onAppear {
                            let baseAnimation = Animation.easeInOut(duration: 1)
                            let repeated = baseAnimation.repeatForever(autoreverses: true)
                            withAnimation(repeated) {
                                scale = 0.5
                            }
                        }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    AddingHelper(helpText: "Example text here")
}
