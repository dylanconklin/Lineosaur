//
//  TableTips.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 1/25/24.
//

import TipKit

struct GraphFactsTip: Tip {
    var title: Text {
        Text("Graph Facts")
    }

    var message: Text? {
        Text("Tap here to see facts about the graph")
    }

    var image: Image? {
        Image(systemName: "lightbulb.max")
    }
}
