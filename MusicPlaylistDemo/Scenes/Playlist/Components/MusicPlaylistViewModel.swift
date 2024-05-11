//
//  MusicPlaylistViewModel.swift
//  MusicPlaylistDemo
//
//  Created by Giovanne Bressam on 10/05/24.
//

import Foundation

class MusicPlaylistViewModel: ObservableObject {
   let playlistService: PlaylistProvider
    @Published var playlistAlbum: PlaylistAlbum?

    init(playlistService: PlaylistProvider) {
        self.playlistService = playlistService
    }
    
    func fetchPlaylist() {
        playlistService.fetchPlaylist { [weak self] result in
            switch result {
            case .success(let playListResult): 
                self?.playlistAlbum = playListResult
            case .failure(let error):
                print(error)
            }
        }
    }
}
