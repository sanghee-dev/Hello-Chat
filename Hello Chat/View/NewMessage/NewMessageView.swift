//
//  MessageView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI

struct NewMessageView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(spacing: 1) {
                    ForEach((0...5), id: \.self) { _ in
                        NavigationLink(
                            destination: ConversationView(),
                            label: {
                                NewMessageCell(imageName: "profile", userName: "Sanghee", message: "Hello")
                            })
                    }
                }
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView()
    }
}
