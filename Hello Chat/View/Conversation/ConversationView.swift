//
//  ConversationView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI

struct ConversationView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach((0...5), id: \.self) { _ in
                    ConversationCell(isFromCurrentUser: false)
                    ConversationCell(isFromCurrentUser: true)
                }
            }
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
