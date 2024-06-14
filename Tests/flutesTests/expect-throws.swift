import Testing
@testable import flutes

//MARK: - Testing for errors

@Suite("ErrorHandling: Testing for errors")
struct ErrorHandling {
    /// Check for particular error
    @Test func playEmptyTrackList() {
        let album = Album(title: "Empty Hits", artist: "VA", songs: [])
        let player = MusicPlayer(album: album)
        #expect(throws: MusicError.emptyTrackList) {
            try player.playAlbum()
        }
    }
    
    /// Handling known issues
    /// Will result in Expected Failure until fixed, then - Failure, to remove Known Issue
    @Test func failingEmptyTrackList() {
        let album = Album(title: "Empty Hits", artist: "VA", songs: [])
        let player = MusicPlayer(album: album)
        withKnownIssue("Music Player is not able to handle empty track list yet") {
            try player.playAlbum()
        }
    }
    
    /// Expect to never throw
    @Test func playsAlbum() {
        let album = Album(title: "Greatest Hits", artist: "VA", songs: [
            Song(title: "Wonderwall", artist: "Oasis", duration: 258, genre: "Rock", year: 1995),
            Song(title: "Smells Like Teen Spirit", artist: "Nirvana", duration: 301, genre: "Grunge", year: 1991)
        ])
        let player = MusicPlayer(album: album)
        #expect(throws: Never.self) {
            try player.playAlbum()
        }
    }
    
    /// Complicated error validations
    @Test func playEmptyTrack() {
        let album = Album(title: "Greatest Hits", artist: "VA", songs: [
            Song(title: "Wonderwall", artist: "Oasis", duration: 258, genre: "Rock", year: 1995),
            Song(title: "Smells Like Teen Spirit", artist: "Nirvana", duration: 0, genre: "Grunge", year: 1991)
        ])
        let player = MusicPlayer(album: album)
       
        /// throws: (any Error) async throws -> Bool
        /// If correct error is thrown, return true
        #expect {
            try player.playAlbum()
        } throws: { error in
            guard let error = error as? MusicError,
                  case let .emptyTrack(songTitle) = error else {
                return false
            }
            return songTitle == "Smells Like Teen Spirit"
        }
    }
}
