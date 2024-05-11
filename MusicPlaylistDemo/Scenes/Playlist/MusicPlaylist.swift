//
//  MusicPlaylist.swift
//  MusicPlaylistDemo
//
//  Created by Giovanne Bressam on 10/05/24.
//

import SwiftUI

struct MusicPlaylist: View {
    private let headerRatioToView = 0.3
    private let topSpacing = 20.0
    @ObservedObject var viewModel: MusicPlaylistViewModel

    var body: some View {
        GeometryReader { geometry in
            Color(UIColor.secondarySystemBackground)
                .ignoresSafeArea()
            if viewModel.playlistAlbum != nil {
                ZStack {
                    VStack {
                        PlaylistHeaderView(coverResource: "album-cover-image")
                            .frame(maxHeight: geometry.size.height * headerRatioToView)
                        Spacer()
                    }.padding(.top, topSpacing)
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            PlaylistControlBar()
                            PlaylistDetailsView(playlistDetailsData: viewModel.playlistAlbum!.details)
                            PlaylistSongListView(playlistAlbum: viewModel.playlistAlbum!)
                        }.padding(.top, 20)
                            .background(content: { Color(UIColor.secondarySystemBackground) })
                            .padding(.top, (geometry.size.height * headerRatioToView) + 20)
                    }.scrollIndicators(.hidden,
                                       axes: [.horizontal, .vertical])
                }
                .padding(.horizontal, 22)
            } else {
                Color(UIColor.secondarySystemBackground)
                    .ignoresSafeArea()
            }
        }.onAppear(perform: {
            viewModel.fetchPlaylist()
        })
    }
}

#Preview {
    MusicPlaylist(viewModel: .init(playlistService: PlaylistService(shouldMock: true)))
}
