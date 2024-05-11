//
//  PlaylistOwnerView.swift
//  MusicPlaylistDemo
//
//  Created by Giovanne Bressam on 10/05/24.
//

import SwiftUI

struct PlaylistOwnerView: View {
    let playlistDetailsData: PlaylistDetailsData
    
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

#Preview(traits: .sizeThatFitsLayout) {
    let mockedData =  PlaylistDetailsData(playlistTitle: "Test title",
                                          playlistDescription: "Description test description test description test description test description test description test",
                                          playlistOwner: "Owner name",
                                          playlistOwnerImageResource: "user-mock-image")
    
    return PlaylistOwnerView(playlistDetailsData: mockedData)
}
