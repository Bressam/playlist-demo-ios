//
//  PlaylistItemView.swift
//  MusicPlaylistDemo
//
//  Created by Giovanne Bressam on 10/05/24.
//

import SwiftUI

struct PlaylistItemView: View {
    let playlistItemData: PlaylistItem
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(playlistItemData.coverResource)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
            
            VStack(spacing: 2) {
                Text(playlistItemData.musicTitle)
                    .font(.title2)
                    .fontWeight(.bold)
                HStack(spacing: 6) {
                    if playlistItemData.isRatedE {
                        Image(systemName: "e.square.fill")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 16)
                    }
                    Text(playlistItemData.bandName)
                        .font(.callout)
                }
            }
            Spacer()
            Image(systemName: "ellipsis")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 18)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PlaylistItemView(playlistItemData: .init(musicTitle: "Music 1",
                                             coverResource: "music--smile",
                                             bandName: "Band 1",
                                             isRatedE: true)
    ).padding()
}
