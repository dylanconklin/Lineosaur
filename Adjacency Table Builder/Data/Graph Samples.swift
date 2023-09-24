//
//  Graph Samples.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 9/20/23.
//

import Foundation

let acyclic_graph: Set<Edge> = [
    Edge(from: "1", to: "2", weight: 1),
    Edge(from: "2", to: "3", weight: 1),
    Edge(from: "2", to: "4", weight: 1),
    Edge(from: "4", to: "5", weight: 1),
    Edge(from: "4", to: "6", weight: 1),
    Edge(from: "5", to: "6", weight: 1),
    Edge(from: "6", to: "3", weight: 1),
]

let cyclic_graph: Set<Edge> = [
    Edge(from: "1", to: "2", weight: 1),
    Edge(from: "2", to: "3", weight: 1),
    Edge(from: "2", to: "4", weight: 1),
    Edge(from: "4", to: "5", weight: 1),
    Edge(from: "5", to: "6", weight: 1),
    Edge(from: "6", to: "3", weight: 1),
    Edge(from: "6", to: "4", weight: 1),
]

var cities: Set<Edge> = [
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

var weighted_graph: Set<Edge> = [
    Edge(from: "a", to: "b", weight: 1),
    Edge(from: "a", to: "c", weight: 7),
    Edge(from: "a", to: "d", weight: 22),
    Edge(from: "b", to: "c", weight: 2),
    Edge(from: "c", to: "f", weight: 30),
    Edge(from: "d", to: "f", weight: 11),
    Edge(from: "d", to: "g", weight: 16),
    Edge(from: "e", to: "f", weight: 31),
    Edge(from: "e", to: "g", weight: 6),
    Edge(from: "f", to: "g", weight: 18),
    Edge(from: "f", to: "h", weight: 35),
    Edge(from: "f", to: "k", weight: 28),
    Edge(from: "h", to: "i", weight: 8),
    Edge(from: "h", to: "j", weight: 24),
    Edge(from: "i", to: "j", weight: 13),
    Edge(from: "j", to: "k", weight: 5),
]
