//
//  MusicPlaylist.swift
//  MusicPlaylistDemo
//
//  Created by Giovanne Bressam on 10/05/24.
//

import SwiftUI

struct MusicPlaylist: View {
    private let headerRatioToView = 0.3
    private let mockedData =  PlaylistDetailsData(playlistTitle: "Test title",
                                                  playlistDescription: "Description test description test description test description test description test description test",
                                                  playlistOwner: "Owner name",
                                                  playlistOwnerImageResource: "user-mock-image")
    let mockedPlaylist: PlaylistAlbum = .init(coverImageResource: "album-cover-image",
                                              details: PlaylistDetailsData(playlistTitle: "Test title",
                                                                           playlistDescription: "Description test description test description test description test description test description test",
                                                                           playlistOwner: "Owner name",
                                                                           playlistOwnerImageResource: "user-mock-image"),
                                              musics: [
                                                .init(musicTitle: "Music 1", coverResource: "music--smile",
                                                      bandName: "Band 1", isRatedE: true)
                                              ])
    private let topSpacing = 20.0

    var body: some View {
        GeometryReader { geometry in
            Color(UIColor.secondarySystemBackground)
                .ignoresSafeArea()
            ZStack {
                VStack {
                    PlaylistHeaderView(coverResource: "album-cover-image")
                        .frame(maxHeight: geometry.size.height * headerRatioToView)
                    Spacer()
                }.padding(.top, topSpacing)
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        PlaylistControlBar()
                        PlaylistDetailsView(playlistDetailsData: mockedData)
                        PlaylistSongListView(playlistAlbum: mockedPlaylist)
                    }.padding(.top, 20)
                        .background(content: { Color(UIColor.secondarySystemBackground) })
                    .padding(.top, (geometry.size.height * headerRatioToView) + 90)
                }
            }
            .padding(.horizontal, 22)
        }
    }
}

#Preview {
    MusicPlaylist()
}
