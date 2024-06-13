import Testing
@testable import flutes

//MARK: Your own tags

extension Tag {
    // single
    @Tag static var repository: Self
    
    // or collection
    enum genres {
        @Tag static var rock: Tag
    }
}

//MARK: Tagged tests
@Suite(.tags(.genres.rock))
struct TaggedRockSuite {
    // Tags are inherited
    
    @Test func createsSixtiesRockSong() async throws {
        let song = Song(title: "Hey Jude", artist: "The Beatles", duration: 431, genre: "Rock", year: 1968)
        #expect(song.artist == "The Beatles")
    }

    @Test func createsSeventiesRockSong() async throws {
        let song = Song(title: "Bohemian Rhapsody", artist: "Queen", duration: 355, genre: "Rock", year: 1975)
        #expect(song.artist == "Queen")
    }
}
