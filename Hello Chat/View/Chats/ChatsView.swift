//
//  ChatsView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/07/29.
//

import SwiftUI

struct ChatsView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(spacing: 1) {
                    ForEach((0...5), id: \.self) { _ in
                        NavigationLink(
                            destination: ConversationView(),
                            label: {
                                ChatCell(imageName: "profile", userName: "Sanghee", conversation: "Hello")
                            })
                    }
                }
            }
            
            Button(action: {
                print("tapped")
            }, label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                    .padding(.all, 14)
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
        }
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView()
    }
}
