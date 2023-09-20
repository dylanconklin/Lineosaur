//
//  Graph Samples.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 9/20/23.
//

import Foundation

let acyclic_graph: Graph = [
    Edge(from: "1", to: "2", weight: 1),
    Edge(from: "2", to: "3", weight: 1),
    Edge(from: "2", to: "4", weight: 1),
    Edge(from: "4", to: "5", weight: 1),
    Edge(from: "4", to: "6", weight: 1),
    Edge(from: "5", to: "6", weight: 1),
    Edge(from: "6", to: "3", weight: 1),
]

let cyclic_graph: Graph = [
    Edge(from: "1", to: "2", weight: 1),
    Edge(from: "2", to: "3", weight: 1),
    Edge(from: "2", to: "4", weight: 1),
    Edge(from: "4", to: "5", weight: 1),
    Edge(from: "5", to: "6", weight: 1),
    Edge(from: "6", to: "3", weight: 1),
    Edge(from: "6", to: "4", weight: 1),
]

var cities: Graph = [
    Edge(from: "Baltimore", to: "Barre", weight: 496),
    Edge(from: "Baltimore", to: "Portland", weight: 2810),
    Edge(from: "Baltimore", to: "Richmond", weight: 149),
    Edge(from: "Baltimore", to: "SLC", weight: 2082),
    Edge(from: "Barre", to: "Portland", weight: 3052),
    Edge(from: "Barre", to: "Richmond", weight: 646),
    Edge(from: "Barre", to: "SLC", weight: 2328),
    Edge(from: "Portland", to: "Richmond", weight: 2867),
    Edge(from: "Portland", to: "SLC", weight: 768),
    Edge(from: "Richmond", to: "SLC", weight: 2141),
]
