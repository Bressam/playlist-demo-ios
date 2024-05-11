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
                                                .init(musicTitle: "Music 1",
                                                      bandName: "Band 1", isRatedE: true)
                                              ])
    private let topSpacing = 60.0

    var body: some View {
        GeometryReader { geometry in
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
                        PlaylistView(playlistAlbum: mockedPlaylist)
                    }.padding(.top, 20)
                    .background(content: { Color.white })
                    .padding(.top, (geometry.size.height * headerRatioToView) + 90)
                }
            }.padding(.horizontal, 22)
            .ignoresSafeArea()
        }
    }
}

struct PlaylistView: View {
    let playlistAlbum: PlaylistAlbum

    var body: some View {
        VStack {
            ForEach(playlistAlbum.musics, id: \.self) {
                Text("\($0)")
                    .frame(minHeight: 30)
                Image(systemName: "ellipsis")
            }
        }
    }
}

struct PlaylistItemView: View {
    let playlistItemData: PlaylistItem

    var body: some View {
        Image(systemName: "e.square.fill")
    }
}

struct PlaylistHeaderView: View {
    @State var coverResource: String

    var body: some View {
        Image(coverResource)
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .shadow(color: .black, radius: 10)
    }
}

#Preview {
    MusicPlaylist()
}
