import Testing
@testable import flutes

// Basic test
@Test func testSong() {
    let song = Song(title: "The Way You Look Tonight", artist: "Tony Bennett", duration: 3.22)
    #expect(song.title == "The Way You Look Tonight")
    #expect(song.artist == "Tony Bennett")
    #expect(song.duration == 3.22)
    #expect(song.genre == nil)
    #expect(song.year == nil)
}

struct LaunchArguments {
    static let songTestEnabled = true
}

/// Note. Evaluated before any tests are run. Availability tests are running first.
func serverIsOnline() async throws -> Bool {
    try await Task.sleep(for: .seconds(1))
    return true
}

//MARK: Сonditional tests
/// Controlling when tests run

@Test(.enabled("Check server availability", serverIsOnline))
func asyncConditionalSongTest() {
    let song = Song(title: "Bohemian Rhapsody", artist: "Queen", duration: 355, genre: "Rock", year: 1975)
    #expect(song.artist == "Queen")
}

@Test(.enabled(if: LaunchArguments.songTestEnabled, "Enabled by launch argument"))
func conditionalSongTest() {
    let song = Song(title: "Bohemian Rhapsody", artist: "Queen", duration: 355, genre: "Rock", year: 1975)
    #expect(song.artist == "Queen")
}

@Test(.disabled("Crashing test"))
func crashingSongTest() {
    // ...
}

@Test
@available(macOS 12, *)
func uniqueMacOSTest() {
    
}
