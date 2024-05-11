//
//  PlaylistHeaderView.swift
//  MusicPlaylistDemo
//
//  Created by Giovanne Bressam on 10/05/24.
//

import SwiftUI

struct PlaylistHeaderView: View {
    @State var coverResource: String
    
    var body: some View {
        Image(coverResource)
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .shadow(color: .black, radius: 10)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PlaylistHeaderView(coverResource: "album-cover-image")
        .padding(60)
}
