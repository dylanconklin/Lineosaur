//
//  GraphEditorTips.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 11/22/23.
//

import TipKit

struct AddEdgeTip: Tip {
    var title: Text {
        Text("Add Edges")
    }

    var message: Text? {
        Text("Tap on + to add an edge to your graph")
    }

    var image: Image? {
        Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
    }
}

struct AddVertexTip: Tip {
    var title: Text {
        Text("Add Vertices")
    }

    var message: Text? {
        Text("Tap on + to add a vertex to your graph")
    }

    var image: Image? {
        Image(systemName: "smallcircle.filled.circle")
    }
}
