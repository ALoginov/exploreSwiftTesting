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
    
    func stopAlbum() {
        for song in album.songs {
            song.stop()
        }
    }
}
