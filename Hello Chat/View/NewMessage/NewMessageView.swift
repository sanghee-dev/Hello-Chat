//
//  MessageView.swift
//  Hello Chat
//
//  Created by leeesangheee on 2021/08/02.
//

import SwiftUI

struct NewMessageView: View {
    @Binding var showConversationView: Bool
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(spacing: 1) {
                    ForEach((0...5), id: \.self) { _ in
                        Button(action: {
                            showConversationView.toggle()
                            mode.wrappedValue.dismiss()
                        }, label: {
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
        NewMessageView(showConversationView: .constant(true))
    }
}
