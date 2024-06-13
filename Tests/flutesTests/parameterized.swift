import Testing
@testable import flutes

//MARK: Parameterized tests

@Suite()
struct ParameterizedSuite {

    // Specify parameter as input
    // Note. Parameters are not listed properly on Xcode 16.0 beta (16A5171c)
    @Test("Create song with specified title", arguments: [
        "Hey Jude",
        "Hotel California",
        "Sweet Child o' Mine"
    ])
    func songCreation(title: String) async throws {
        let song = Song(title: title, artist: "", duration: 0, genre: "Genre", year: 1900)
        #expect(song.title == title)
    }
    
    @Test("Create song with specified title and artist", arguments: [
        "Hey Jude",
        "Hotel California",
        "Sweet Child o' Mine"
    ], [
        "The Beatles",
        "Eagles",
        "Guns N' Roses"
    ])
    func complexSongCreation(title: String, artist: String) async throws {
        let song = Song(title: title, artist: artist, duration: 0, genre: "Genre", year: 1900)
        #expect(song.title == title)
        #expect(song.artist == artist)
    }
    
    @Test("Create song with tuple", arguments: zip([
        "Hey Jude",
        "Hotel California",
        "Sweet Child o' Mine"
    ], [
        "The Beatles",
        "Eagles",
        "Guns N' Roses"
    ]))
    func complexSongCreationButWithTuples(title: String, artist: String) async throws {
        let song = Song(title: title, artist: artist, duration: 0, genre: "Genre", year: 1900)
        #expect(song.title == title)
        #expect(song.artist == artist)
    }
}
