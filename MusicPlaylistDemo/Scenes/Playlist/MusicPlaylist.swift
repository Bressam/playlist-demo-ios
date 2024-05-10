//
//  MusicPlaylist.swift
//  MusicPlaylistDemo
//
//  Created by Giovanne Bressam on 10/05/24.
//

import SwiftUI

struct MusicPlaylist: View {
    var body: some View {
        VStack {
            PlaylistHeaderView(coverResource: "album-cover-image")
        }
        .padding()
    }
}

struct PlaylistHeaderView: View {
    @State var coverResource: String

    var body: some View {
        Image(coverResource)
            .aspectRatio(contentMode: .fit)
            .shadow(color: .black, radius: 10)
    }
}

#Preview {
    MusicPlaylist()
}
