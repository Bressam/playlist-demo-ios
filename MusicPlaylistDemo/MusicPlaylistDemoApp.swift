//
//  MusicPlaylistDemoApp.swift
//  MusicPlaylistDemo
//
//  Created by Giovanne Bressam on 10/05/24.
//

import SwiftUI

@main
struct MusicPlaylistDemoApp: App {
    
    // MARK: - Services
    let playlistService: PlaylistService

    var body: some Scene {
        WindowGroup {
            MusicPlaylist(viewModel: .init(playlistService: playlistService))
        }
    }
    
    init() {
        playlistService = .init(shouldMock: true)
    }
}
