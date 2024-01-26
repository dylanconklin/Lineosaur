//
//  TableTips.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 1/25/24.
//

import TipKit

struct EmptyTableTip: Tip {
    var title: Text {
        Text("Build Graph")
    }

    var message: Text? {
        Text("Tap on the Edit tab to add edges to your graph")
    }

    var image: Image? {
        Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
    }
}

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
