//
//  PlaylistProvider.swift
//  MusicPlaylistDemo
//
//  Created by Giovanne Bressam on 10/05/24.
//

import Foundation

protocol PlaylistProvider: MockGenerator {
    func fetchPlaylist(completion: @escaping (Result<PlaylistAlbum, any Error>) -> Void)
    
    func generateMockData()
}
