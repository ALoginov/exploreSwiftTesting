// The Swift Programming Language
// https://docs.swift.org/swift-book

class Song {
    var title: String
    var artist: String
    var duration: Double
    var genre: String?
    var year: Int?
    
    init(title: String, artist: String, duration: Double, genre: String? = nil, year: Int? = nil) {
        self.title = title
        self.artist = artist
        self.duration = duration
        self.genre = genre
        self.year = year
    }
    
    func play() {
        print("Playing \(title) by \(artist)")
    }
    
    func playAsynchronously() async {
        print("Playing \(title) by \(artist)")
    }
    
    func stop() {
        print("Stopping \(title)")
    }
}

class Album {
    var title: String
    var artist: String
    var songs: [Song]
    
    init(title: String, artist: String, songs: [Song]) {
        self.title = title
        self.artist = artist
        self.songs = songs
    }
}

enum MusicError: Error, Equatable {
    case emptyTrackList
    case emptyTrack(songTitle: String)
}

class MusicPlayer {
    var album: Album
    
    init(album: Album) {
        self.album = album
    }
    
    func playAlbum() throws(MusicError) {
        guard !album.songs.isEmpty else {
            throw .emptyTrackList
        }
        for song in album.songs {
            guard song.duration > 0 else {
                throw .emptyTrack(songTitle: song.title)
            }
            song.play()
        }
    }
    
    func playAlbum(with completionBlock: ((Bool) -> Void)) {
        do {
            try self.playAlbum()
            completionBlock(true)
        } catch {
            completionBlock(false)
        }
    }
    
    // Play album with callback
    func playAlbumAsynchronously(_ callback: ((Song) -> Void)? = nil) async throws(MusicError) -> Int {
        guard !album.songs.isEmpty else {
            throw .emptyTrackList
        }
        var numSongs: Int = 0
        for song in album.songs {
            guard song.duration > 0 else {
                throw .emptyTrack(songTitle: song.title)
            }
            // Start playing
            await song.playAsynchronously()
            // Notify
            callback?(song)
            numSongs += 1
        }
        return numSongs
    }
    
    func stopAlbum() {
        for song in album.songs {
            song.stop()
        }
    }
}
