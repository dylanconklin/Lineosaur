//
//  Tutorial.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 2/25/24.
//

import SwiftUI
import TipKit

struct TutorialTip: Tip {
    var title: Text { Text("Need Help?") }
    var message: Text? { Text("Learn the basic features of Lineosaur, and how to use it") }
    var image: Image? { Image(systemName: "graduationcap.fill") }
    var actions: [Tip.Action] {
        [
            Tips.Action(title: "Open Tutorial") {}
        ]
    }
}

struct Tutorial: View {
    var body: some View {
        VStack {
            CloseButtonView {
                VStack {
                    Text("Thank you for downloading Lineosaur!")
                        .multilineTextAlignment(.center)
                        .font(.title)
                    List {
                        Tutorial1()
                            .padding()
                        Tutorial2()
                            .padding()
                        Tutorial3()
                            .padding()
                        Tutorial4()
                            .padding()
                        Tutorial5()
                            .padding()
                        Tutorial6()
                            .padding()
                    }
                }
            }
        }
    }
}

struct Tutorial1: View {
    var body: some View {
        HStack {
            Image(systemName: "app.connected.to.app.below.fill")
                .accessibilityLabel("Tutorial label for adding edge")
                .font(.system(size: 32))
            Text("Click the + button to add edges to the graph\n\nStart by adding a single edge. "
                + "The vertices will be added for you automatically!")
                .padding(.horizontal)
        }
    }
}

struct Tutorial2: View {
    var body: some View {
        HStack {
            Image(systemName: "character.bubble")
                .accessibilityLabel("Tutorial label for naming vertices")
                .font(.system(size: 32))
            Text("The names of the endpoints can include spaces, special characters and emojis")
                .padding(.horizontal)
        }
    }
}

struct Tutorial3: View {
    var body: some View {
        HStack {
            Image(systemName: "list.bullet")
                .accessibilityLabel("Tutorial label for viewing edges")
                .font(.system(size: 32))
            Text("You will see the edges appear in a list as you add them")
                .padding(.horizontal)
        }
    }
}

struct Tutorial4: View {
    var body: some View {
        HStack {
            Image(systemName: "point.3.filled.connected.trianglepath.dotted")
                .accessibilityLabel("Tutorial label for view tabs")
                .font(.system(size: 32))
            Text("Tap the bottom of your screen to view the graph visually, or as a table")
                .padding(.horizontal)
        }
    }
}

struct Tutorial5: View {
    var body: some View {
        HStack {
            Image(systemName: "hand.tap.fill")
                .accessibilityLabel("Tutorial label for gestures")
                .font(.system(size: 32))
            Text("Tap and hold the edges to see advanced actions")
                .padding(.horizontal)
        }
    }
}

struct Tutorial6: View {
    var body: some View {
        HStack {
            Image(systemName: "square.and.arrow.down")
                .accessibilityLabel("Tutorial label for loading and saving graphs")
                .font(.system(size: 32))
            Text("Create and load multiple graphs in Settings")
                .padding(.horizontal)
        }
    }
}

#Preview {
    Tutorial()
}
