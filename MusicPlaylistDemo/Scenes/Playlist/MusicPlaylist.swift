//
//  MusicPlaylist.swift
//  MusicPlaylistDemo
//
//  Created by Giovanne Bressam on 10/05/24.
//

import SwiftUI

struct MusicPlaylist: View {
    private let headerRatioToView = 0.3
    private let mockedData =  PlyalistDetailsData(playlistTitle: "Test title",
                                                  playlistDescription: "Description test description test description test description test description test description test",
                                                  playlistOwner: "Owner name",
                                                  playlistOwnerImageResource: "user-mock-image")
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
                        PlaylistView()
                    }.padding(.top, 20)
                    .background(content: { Color.white })
                    .padding(.top, (geometry.size.height * headerRatioToView) + 90)
                }
            }.padding(.horizontal, 22)
            .ignoresSafeArea()
        }
    }
}

struct PlyalistDetailsData {
    let playlistTitle: String
    let playlistDescription: String
    let playlistOwner: String
    let playlistOwnerImageResource: String
}

struct PlaylistDetailsView: View {
    let playlistDetailsData: PlyalistDetailsData

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(playlistDetailsData.playlistTitle)
                .font(.title)
                .fontWeight(.bold)
            Text(playlistDetailsData.playlistDescription)
                .font(.callout)
            PlaylistOwnerView(playlistDetailsData: playlistDetailsData)
        }
    }
}

struct PlaylistOwnerView: View {
    let playlistDetailsData: PlyalistDetailsData

    var body: some View {
        HStack (spacing: 8) {
            Image(playlistDetailsData.playlistOwnerImageResource)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26)
                .clipShape(Circle())
            Text("Playlist de \(playlistDetailsData.playlistOwner)")
                .fontWeight(.bold)
                .font(.callout)
            Spacer()
        }
    }
}

struct PlaylistControlBar: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "arrow.down.circle.fill")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 18)
                    .foregroundStyle(.black)
            }
            
            Button(action: {}) {
                Image(systemName: "person.fill.badge.plus")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .frame(width: 18)
                    .foregroundStyle(.black)
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "play.circle.fill")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.orange)
                    .frame(width: 30)
            }
        }
    }
}

struct PlaylistView: View {
    let listaMusicas = 1...100

    var body: some View {
        VStack {
            ForEach(listaMusicas, id: \.self) {
                Text("\($0)")
                    .frame(minHeight: 30)
            }
        }
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
