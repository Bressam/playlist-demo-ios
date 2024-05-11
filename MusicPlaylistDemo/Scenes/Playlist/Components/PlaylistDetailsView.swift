//
//  PlaylistDetailsView.swift
//  MusicPlaylistDemo
//
//  Created by Giovanne Bressam on 10/05/24.
//

import SwiftUI

struct PlaylistDetailsData {
    let playlistTitle: String
    let playlistDescription: String
    let playlistOwner: String
    let playlistOwnerImageResource: String
}

struct PlaylistDetailsView: View {
    let playlistDetailsData: PlaylistDetailsData
    
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

#Preview(traits: .sizeThatFitsLayout) {
    let mockedData =  PlaylistDetailsData(playlistTitle: "Test title",
                                                  playlistDescription: "Description test description test description test description test description test description test",
                                                  playlistOwner: "Owner name",
                                                  playlistOwnerImageResource: "user-mock-image")
    return PlaylistDetailsView(playlistDetailsData: mockedData)
}
