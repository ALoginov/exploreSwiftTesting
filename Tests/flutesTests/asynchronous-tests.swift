import Testing
@testable import flutes

@Suite("Asynchronous: await & confirm")
struct AsynchronousSuite {
    let album = Album(title: "Greatest Hits", artist: "VA", songs: [
        Song(title: "Wonderwall", artist: "Oasis", duration: 258, genre: "Rock", year: 1995),
        Song(title: "Smells Like Teen Spirit", artist: "Nirvana", duration: 301, genre: "Grunge", year: 1991)
    ])
    
    @Test func playsAlbumAsynchronously() async throws {
        let player = MusicPlayer(album: album)
        let numSongsPlayed = try await player.playAlbumAsynchronously()
        #expect(numSongsPlayed == album.songs.count)
    }
    
    /// Using confirmation as option to await for old-style completion blocks
    @Test func confirmationBlockFired() async {
        let player = MusicPlayer(album: album)
        await confirmation("await for completion block") { confirmation in
            player.playAlbum { success in
                confirmation()
            }
        }
    }
    
    /// Confirm that event happened required amount of times
    /// Set 0 if confirmation shoild never be called
    @Test func everySongIsPlayed() async throws {
        let player = MusicPlayer(album: album)
        let _ = try await confirmation("enumerate on callback", expectedCount: album.songs.count) { confirmation in
            try await player.playAlbumAsynchronously { _ in
                confirmation()
            }
        }
    }
}
