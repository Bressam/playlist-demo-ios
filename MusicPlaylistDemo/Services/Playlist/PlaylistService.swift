//
//  PlaylistService.swift
//  MusicPlaylistDemo
//
//  Created by Giovanne Bressam on 10/05/24.
//

import Foundation

class PlaylistService: PlaylistProvider {
    var cachedPlaylist: PlaylistAlbum?
    let shouldMock: Bool
    
    init(shouldMock: Bool) {
        self.shouldMock = shouldMock
    }
    
    func fetchPlaylist(completion: @escaping (Result<PlaylistAlbum, Error>) -> Void) {
        if shouldMock {
            generateMockData()
        }
        guard let cachedPlaylist else {
            completion(.failure("Missing cached data. No fallback defined." as! Error))
            return
        }
        completion(.success(cachedPlaylist))
    }

    func generateMockData() {
        cachedPlaylist = .init(coverImageResource: "album-cover-image",
                details: mockAlbumDetails(),
                musics: mockMusicList())
    }
    
    private func mockAlbumDetails() -> PlaylistDetailsData {
        PlaylistDetailsData(playlistTitle: "Playlist Maneira",
                            playlistDescription: "Essa playlist é destinada aos melhores Jr.\nLearners do Planeta ADDA",
                            playlistOwner: "Yosda",
                            playlistOwnerImageResource: "user-mock-image")
    }
    private func mockMusicList() -> [PlaylistItem] {
        return [
            .init(musicTitle: "Dog Days Are Over",
                  coverResource: "music-dog-days-are-over",
                  bandName: "Florence + The Machine",
                  isRatedE: false),
            .init(musicTitle: "Glasshouses",
                  coverResource: "music-glasshouses",
                  bandName: "Maribou State",
                  isRatedE: true),
            .init(musicTitle: "Against The Grain",
                  coverResource: "music-against-the-grain",
                  bandName: "City and Colour",
                  isRatedE: false),
            .init(musicTitle: "Homemade Dynamite",
                  coverResource: "music-homemade-dynamite",
                  bandName: "Lorde",
                  isRatedE: true),
            .init(musicTitle: "Let Go",
                  coverResource: "music-let-go",
                  bandName: "LAUREL",
                  isRatedE: false),
            .init(musicTitle: "Smile",
                  coverResource: "music-smile",
                  bandName: "Wolf Alice",
                  isRatedE: false),
            .init(musicTitle: "The Kids From Yesterday",
                  coverResource: "music-the-kids-from-yesterday",
                  bandName: "My Chemical Romance",
                  isRatedE: false)
        ]
    }
}
