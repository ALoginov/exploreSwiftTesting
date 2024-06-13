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

class MusicPlayer {
    var album: Album
    
    init(album: Album) {
        self.album = album
    }
    
    func playAlbum() {
        print("Playing album: \(album.title) by \(album.artist)")
        for song in album.songs {
            song.play()
        }
    }
    
    func stopAlbum() {
        print("Stopping album: \(album.title)")
        for song in album.songs {
            song.stop()
        }
    }
}
