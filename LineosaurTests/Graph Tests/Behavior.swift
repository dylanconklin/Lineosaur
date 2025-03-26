@testable import Lineosaur
import Testing

@Suite
struct Behavior {
    @Test
    func verticesAreInsertedWithEdges() {
        // given
        let sut: Graph = .init()
        let expectedResult: [Vertex] = ["a", "b", "c"]

        // when
        sut.insert(Edge(from: "a", toward: "b", weight: 1.0))
        sut.insert(Edge(from: "b", toward: "c", weight: 1.0))

        // then
        #expect(sut.vertices == expectedResult)
    }

    @Test
    func verticesAreInsertedWithEdgesBinding() {
        // given
        let sut: Graph = .init()
        let expectedResult: [Vertex] = ["a", "b", "c"]

        // when
        sut.edges = [
            Edge(from: "a", toward: "b", weight: 1.0),
            Edge(from: "b", toward: "c", weight: 1.0),
        ]

        // then
        #expect(sut.vertices == expectedResult)
    }

    @Test
    func verticesPersistAfterAllEdgeAreDeleted() {
        // given
        let sut: Graph = .init()
        let expectedResult: [Vertex] = ["a", "b", "c"]

        // when
        sut.insert(Edge(from: "a", toward: "b", weight: 1.0))
        sut.insert(Edge(from: "b", toward: "c", weight: 1.0))

        sut.remove(Edge(from: "a", toward: "b", weight: 1.0))
        sut.remove(Edge(from: "b", toward: "c", weight: 1.0))

        // then
        #expect(sut.vertices == expectedResult)
    }

    @Test
    func removeAllEdgesConnectedToRemovedVertices() {
        // given
        let sut: Graph = .init()
        let expectedResult: [Edge] = [Edge(from: "b", toward: "c", weight: 1.0)]

        // when
        sut.insert(Edge(from: "a", toward: "b", weight: 1.0))
        sut.insert(Edge(from: "b", toward: "c", weight: 1.0))

        sut.remove("a")

        // then
        #expect(sut.edges == expectedResult)
    }
}
