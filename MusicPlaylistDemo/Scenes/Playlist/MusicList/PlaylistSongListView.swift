//
//  PlaylistSongListView.swift
//  MusicPlaylistDemo
//
//  Created by Giovanne Bressam on 10/05/24.
//

import SwiftUI

struct PlaylistSongListView: View {
    let playlistAlbum: PlaylistAlbum
    
    var body: some View {
        VStack {
            ForEach(playlistAlbum.musics, id: \.self) {
                PlaylistItemView(playlistItemData: $0)
                    .padding(.vertical, 8)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let mockedPlaylist: PlaylistAlbum = .init(coverImageResource: "album-cover-image",
                                              details: PlaylistDetailsData(playlistTitle: "Test title",
                                                                           playlistDescription: "Description test description test description test description test description test description test",
                                                                           playlistOwner: "Owner name",
                                                                           playlistOwnerImageResource: "user-mock-image"),
                                              musics: [
                                                .init(musicTitle: "Music 1", coverResource: "music--smile",
                                                      bandName: "Band 1", isRatedE: true),
                                              .init(musicTitle: "Music 1", coverResource: "music--smile",
                                                    bandName: "Band 1", isRatedE: true),
                                              .init(musicTitle: "Music 1", coverResource: "music--smile",
                                                    bandName: "Band 1", isRatedE: true)
                                              ])
    
    return PlaylistSongListView(playlistAlbum: mockedPlaylist)
        .padding()
}
