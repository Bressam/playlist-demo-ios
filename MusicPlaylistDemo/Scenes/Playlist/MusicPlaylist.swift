//
//  MusicPlaylist.swift
//  MusicPlaylistDemo
//
//  Created by Giovanne Bressam on 10/05/24.
//

import SwiftUI

struct MusicPlaylist: View {
    let headerRatioToView = 0.3
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    PlaylistHeaderView(coverResource: "album-cover-image")
                        .frame(maxHeight: geometry.size.height * headerRatioToView)
                    Spacer()
                }.padding(.top, 60)
                ScrollView {
                    VStack(spacing: 1) {
                        PlaylistControlBar()
                            .padding([.leading, .trailing], 22)
                        Text("Titulo")
                            .font(.title)
                        PlaylistView()
                            .frame(width: geometry.size.width)
                    }
                    .background(content: { Color.white })
                    .padding(.top, geometry.size.height * headerRatioToView + 80)
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct PlaylistControlBar: View {
    var body: some View {
        HStack {
            Image(systemName: "arrow.down.circle.fill")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 18)
            Image(systemName: "person.fill.badge.plus")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .rotation3DEffect(
                    .degrees(180),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                .frame(width: 18)
            Spacer()
            Image(systemName: "play.circle.fill")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.orange)
                .frame(width: 30)
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
