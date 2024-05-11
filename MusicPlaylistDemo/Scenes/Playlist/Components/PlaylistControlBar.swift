//
//  PlaylistControlBar.swift
//  MusicPlaylistDemo
//
//  Created by Giovanne Bressam on 10/05/24.
//

import SwiftUI

struct PlaylistControlBar: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "arrow.down.circle.fill")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 18)
                    .foregroundStyle(Color(UIColor.label))
                    .bold()
            }
            
            Button(action: {}) {
                Image(systemName: "person.fill.badge.plus")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .frame(width: 20)
                    .foregroundStyle(Color(UIColor.label))
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "play.circle.fill")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.orange)
                    .frame(width: 35)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PlaylistControlBar()
        .padding()
}
